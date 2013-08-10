package com.ubc.ca.service;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import com.ubc.ca.exception.ReturnException;

public class ReturnService {
	
	private static Connection con;
	private ItemService is;
	
	/**
	 * Main Return method, checks if the return is valid, then saves to database
	 * and updates stock
	 * 
	 * @param receiptid
	 * @param qtyReturned
	 * @param upc
	 * @throws ConnectException 
	 * @throws Exception
	 */
	
	public ReturnService() throws ConnectException {
		con = ConnectionService.getConnection();
		is = new ItemService();
	}
	
	/**
	 * checks if return is valid (date and quantity)
	 * if valid, adds tuples to the Return/Return Item tables and prints total amount
	 * 
	 * @param receiptid
	 * @param qtyReturned
	 * @param upc
	 * @return retid
	 * @throws Exception
	 */
	public int checkAndProcessReturn(int receiptid, int qtyReturned, String upc) throws Exception {
		int retid = 0;
		
		try {
			PreparedStatement ps = con.prepareStatement(
					"SELECT purchase_date, card_no, item_price, quantity " +
					"FROM Purchase P, PurchaseItem PI, Item I " +
					"WHERE P.receiptid = PI.receiptid AND I.upc = PI.upc " +
					"AND PI.upc=? AND P.receiptid=?");
			
			ps.setString(1, upc);
			ps.setInt(2, receiptid);
			
			ResultSet rs = ps.executeQuery();
			
			if (!rs.next()) {
				throw new ReturnException("ERROR: No such purchase exists.");
				
			} else {				
				// get data
				float price = rs.getFloat("item_price");
				int qty = rs.getInt("quantity");					
				String cardno = rs.getString("card_no");
				java.sql.Date purchaseDate = rs.getDate("purchase_date");
				
				// make sure not returning more than was bought
				if (qtyReturned > qty) {
					throw new ReturnException("Returning more items than purchased.");
				}
	
				// get the current date from the database
				java.sql.Date returnDate = getCurrentDate();			
				
				// check if return is within valid date range
				if (isValidReturn(purchaseDate, returnDate)) {		
					// insert into tables and update stock
					retid = processReturn(receiptid, returnDate, upc, qtyReturned);	
					is.UpdateItem(upc, qty);
					printReturn(price, cardno, qty, qtyReturned);	
					
				} else {
					throw new ReturnException("Return is invalid. Over 15 days have passed.");
				}
			}		
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ReturnException("Could not process return.");
		}
		return retid;	
	}
	
	/**
	 * Inserts return into the Return table. If successful, also inserts into ReturnItem
	 * 
	 * @param receiptid
	 * @param returnDate
	 * @param upc
	 * @param qty
	 * @return retid
	 * @throws SQLException
	 */
	public int processReturn(int receiptid, java.util.Date returnDate, String upc, int qty) throws SQLException {	
		int retid = 0; // generated after insert into Return
		
		try {
			// insert return date, receiptid into Return table
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO ams_Return values (retid.nextval, ?, ?)",
					new String[]{"returnid"});
			ps.setDate(1, new java.sql.Date(returnDate.getTime()));
			ps.setInt(2, receiptid);
			ps.executeQuery();
			con.commit();
			
			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
			retid = rs.getInt(1);
			
			processReturnItem(upc, retid, qty);
			
		} catch (ReturnException e) { //thrown by processReturnItem
			rollback();
			e.printStackTrace();
			throw new SQLException("Could not process return of item ");		
		}
		return retid;
	}
	
	/**
	 * Inserts return item into the ReturnItem table. retid is generated by processReturn()
	 * 
	 * @param upc
	 * @param retid
	 * @param qty
	 */
	public void processReturnItem(String upc, int retid, int qty) throws ReturnException {
		try {
			PreparedStatement ps = con.prepareStatement(
					"INSERT into ReturnItem values (?, ?, ?)");
			ps.setString(1, upc);
			ps.setInt(2, retid);
			ps.setInt(3, qty);
			ps.executeQuery();
			
			con.commit();
			
		} catch (SQLException e) {
			rollback();
			e.printStackTrace();
			throw new ReturnException();
		}
	}
	
	/**
	 * Prints method and amount of the return
	 * 
	 * @param price
	 * @param cardno
	 * @param qty
	 * @param qtyReturned
	 */
	public void printReturn(float price, String cardno, int qty, int qtyReturned) {
		NumberFormat formatter = NumberFormat.getInstance();
		formatter.setMinimumFractionDigits(2);
		formatter.setMaximumFractionDigits(2);
		
		float retTotal = qtyReturned * price;
		  
		String retType = cardno==null ? "CASH" : "CARD";
		System.out.println(retType + " return: $" + formatter.format(retTotal));
	}
	
	/**
	 * Gets the current data from the database in java.sql.date type
	 * @return current date
	 * @throws Exception
	 */
	private java.sql.Date getCurrentDate() {
		java.sql.Date returnDate = null;
		
		try {
			PreparedStatement date_query = con.prepareStatement("SELECT sysdate FROM dual");
			ResultSet date_result = date_query.executeQuery();
			if (date_result.next()) {
				returnDate = date_result.getDate(1);
			}
		} catch (SQLException e) {
			System.out.println("Could not retrieve sysdate.");
			e.printStackTrace();
		}
		return returnDate;
	}
	
/**
 * Returns true if system date is less than 15 days from purchase date.
 * Assuming that you bought it at midnight 
 * ie. Purchase date Jan 1 is valid until the end of Jan 16
 * 
 * @param purchaseDate
 * @param returnDate
 * @return
 */
	public boolean isValidReturn(java.sql.Date purchaseDate, java.sql.Date returnDate) {
		// Calculate the last day item can be returned
		Calendar lastDate = new GregorianCalendar();
		lastDate.setTime(purchaseDate);
		lastDate.add(Calendar.DAY_OF_MONTH, 15);

		Calendar retDate = new GregorianCalendar();
		retDate.setTime(new java.util.Date(returnDate.getTime()));
		
		return retDate.before(lastDate) || retDate.equals(lastDate);
	}
	
	/**
	 * rollback method
	 */
	private void rollback() {
		try {
			con.rollback();
		} catch (SQLException e) {
			System.out.println("Could not rollback the last transaction.");
			e.printStackTrace();
		}
	}
}

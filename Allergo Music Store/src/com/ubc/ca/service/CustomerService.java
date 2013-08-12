package com.ubc.ca.service;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ubc.ca.exception.ConnectionException;

public class CustomerService {
	private static Connection con;


	public void registerCustomer(String cid, String cname, String cadd, String password, String cphone) throws Exception{
		con = ConnectionService.getConnection();
		
		try {
			PreparedStatement ps = con.prepareStatement("INSERT INTO customer VALUES (?,?,?,?,?)");
			
			if (cid.length() == 0)
	          {
				cid = null;
		      ps.setString(1, null);
		  }
			else {
			ps.setString(1, cid);
			}
			
			ps.setString(2, cname);
			ps.setString(3, cadd);
			
			if (password.length() == 0)
	          {
				password = null; 
		      ps.setString(4, null);
		  }
			else {
			ps.setString(4, password);
			}
			
			ps.setString(5, cphone);
			
			ps.executeUpdate();
			
			con.commit();
			
			
			
		} catch (SQLException e) {
			try {
				// undo the insert
				con.rollback();
				e.printStackTrace();
			} catch (SQLException e1) {
				System.out.println("Message: " + e1.getMessage());
				System.exit(-1);
			}

			if (cid == null || password == null) {
				throw new Exception("ERROR: Please fill in all fields!");
			} else {
				throw new Exception(
						"ERROR: User ID has already been taken. Try another!");
			}
		}
		
				
	}
}

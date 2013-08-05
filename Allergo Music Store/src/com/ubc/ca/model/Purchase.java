package com.ubc.ca.model;

import java.net.ConnectException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import com.ubc.ca.service.ProductService;

public class Purchase {

	private String customerId;
	private float  totalprice;
	private Date   purchasedDate;
	private ArrayList<Item> shoppingCart= new ArrayList<Item>();
	private String receiptId;
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public float getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(float totalprice) {
		this.totalprice = totalprice;
	}
	public Date getPurchasedDate() {
		return purchasedDate;
	}
	public void setPurchasedDate(Date purchasedDate) {
		this.purchasedDate = purchasedDate;
	}
	public ArrayList<Item> getShoppingCart() {
		return shoppingCart;
	}
	public void setShoppingCart(ArrayList<Item> shoppingCart) {
		this.shoppingCart = shoppingCart;
	}
	public String getReceiptId() {
		return receiptId;
	}
	public void setReceiptId(String receiptId) {
		this.receiptId = receiptId;
	}
	
	
	public String generateOrder()
	{
		FacesContext facesContext = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) facesContext.getExternalContext().getSession(false);
		String userId=(String) session.getAttribute("username");
		this.customerId=userId;		
		this.purchasedDate=new Date(System.currentTimeMillis());
		ProductService service = new ProductService();
		try {
			this.receiptId= service.saveOrder(totalprice, customerId);
		} catch (ConnectException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "orderConfirmation";
	}
	
}

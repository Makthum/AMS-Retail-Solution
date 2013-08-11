package com.ubc.ca.model;

import java.net.ConnectException;

import com.ubc.ca.service.ReturnService;

public class Return {

	private int receiptid;
	private String upc;
	private int quantity;
	private int retid;
	private String statusmessage;


	

	public String getStatusmessage() {
		return statusmessage;
	}




	public void setStatusmessage(String statusmessage) {
		this.statusmessage = statusmessage;
	}




	public int getReceiptid() {
		return receiptid;
	}




	public void setReceiptid(int receiptid) {
		this.receiptid = receiptid;
	}




	public String getUpc() {
		return upc;
	}




	public void setUpc(String upc) {
		this.upc = upc;
	}




	public int getQuantity() {
		return quantity;
	}




	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}




	public int getRetid() {
		return retid;
	}




	public void setRetid(int retid) {
		this.retid = retid;
	}




	public String saveReturn()  {
		ReturnService rs;
		try {
			rs = new ReturnService();
			int retid = rs.checkAndProcessReturn(receiptid, quantity, upc);
			this.retid = retid;
			this.statusmessage=" Item Returned and Return Id :" + retid; 
			return "success";
		} catch (ConnectException e) {
			// TODO Auto-generated catch block
			this.statusmessage=" Couldn't Process return" + e.getMessage();
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			this.statusmessage=" Couldn't Process return" + e.getMessage();

			e.printStackTrace();
		}
		return "failure";
	}

}

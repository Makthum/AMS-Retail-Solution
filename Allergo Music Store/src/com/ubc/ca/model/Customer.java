package com.ubc.ca.model;

import java.net.ConnectException;

import com.ubc.ca.service.CustomerService;

public class Customer {
 //Customer Attributes
	private String cid;
	private String cname; 
	private String caddress;
	private String cpassword; 
	private String cphone; 
	



public String getCid() {
		return cid;
	}



	public void setCid(String cid) {
		this.cid = cid;
	}



	public String getCname() {
		return cname;
	}



	public void setCname(String cname) {
		this.cname = cname;
	}



	public String getCaddress() {
		return caddress;
	}



	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}



	public String getCpassword() {
		return cpassword;
	}



	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}



	public String getCphone() {
		return cphone;
	}



	public void setCphone(String cphone) {
		this.cphone = cphone;
	}



public String registerCustomer()
  {
	  CustomerService service;
	  
	try {
		service = new CustomerService();
		  service.registerCustomer(cid, cname, caddress, cpassword, cphone);
		  return "login";
	} catch (ConnectException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "reload";
  }

}

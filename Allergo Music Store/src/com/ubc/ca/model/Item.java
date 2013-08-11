package com.ubc.ca.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.sun.faces.facelets.tag.jstl.core.CatchHandler;
import com.ubc.ca.service.ItemService;
import com.ubc.ca.service.ProductService;
import com.ubc.ca.service.ReportService;

/**
 * 
 * @author Mohamed Makthum This Model class contains attributes and fields
 *         associated with Item object used in shopping cart and Order
 *         transaction.
 */

public class Item {

	// Item object attributes

	private String title;
	private String category;
	private String UPC;
	private int quantity;
	private float price;
    private float totalPrice;
    private String company;
    private int qtySold;
    private String deliveryDate;
    private int receiptId;
	// Holds any error message to be displayed encountered during db transaction

    
    private String errorMessage;

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	private String LeadSinger;

	public String getLeadSinger() {
		return LeadSinger;
	}

	public void setLeadSinger(String leadSinger) {
		LeadSinger = leadSinger;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getUPC() {
		return UPC;
	}

	public void setUPC(String uPC) {
		UPC = uPC;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public void setQtySold(int qtySold) {
		this.qtySold = qtySold;
	}

	public int getQtySold() {
		return qtySold;
	}
	
	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public int getReceiptId() {
		return receiptId;
	}

	public void setReceiptId(int receiptId) {
		this.receiptId = receiptId;
	}

	

	public String updateItem()
	{
		ItemService service= new ItemService();
		try
		{
			if(price!=0)
		{
		service.UpdateItem(UPC, quantity,price);
		}
		else
		{
			service.UpdateItem(UPC, quantity);
		}
			this.errorMessage=" Item Updated Successfully";
		}
		catch(Exception e)
		{
			this.errorMessage=e.getMessage();
			e.printStackTrace();
		}
		return "sucess";
			
	}

   public String setDelDate()
   {
	   ProductService service= new ProductService();
	   try
	   {
		   SimpleDateFormat date= new SimpleDateFormat("dd/MM/yyyy");
		   java.util.Date date_temp=date.parse(this.deliveryDate);
		   service.setDeliveryDate(new Date(date_temp.getTime()), receiptId);
		   this.errorMessage="Order Updated successfully";
	   }
	   catch(Exception e)
	   {
		   this.errorMessage="Order Processing Failed " + e.getMessage();
		  e.printStackTrace(); 
	   }
	   return "success";
   }

  
}

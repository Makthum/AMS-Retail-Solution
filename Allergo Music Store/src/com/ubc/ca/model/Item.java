package com.ubc.ca.model;

public class Item {
	private String title;
	private String category;
	private String UPC;
	private int quantity;
	private boolean is_Selected;
	public boolean isIs_Selected() {
		return is_Selected;
	}
	public void setIs_Selected(boolean is_Selected) {
		this.is_Selected = is_Selected;
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
	

}

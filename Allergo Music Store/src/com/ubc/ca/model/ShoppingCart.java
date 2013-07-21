package com.ubc.ca.model;

import java.io.IOException;
import java.net.ConnectException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;



import com.ubc.ca.service.ProductService;

public class ShoppingCart {

	
	private Item item= new Item();
	private Map<Long, Boolean> checked = new HashMap<Long, Boolean>();
	
	public Map<Long, Boolean> getChecked() {
		return checked;
	}

	public void setChecked(Map<Long, Boolean> checked) {
		this.checked = checked;
	}

	

	
	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	private ArrayList<Item> shoppingcart= new ArrayList<Item>();
	private ArrayList<Item> searchList= new ArrayList<Item>();

	public ArrayList<Item> getSearchList() {
		return searchList;
	}

	public void setSearchList(ArrayList<Item> searchList) {
		this.searchList = searchList;
	}

	public ArrayList<Item> getShoppingcart() {
		return shoppingcart;
	}

	public void setShoppingcart(ArrayList<Item> shoppingcart) {
		this.shoppingcart = shoppingcart;
	}
	
  public String AddCart()
  {

		  shoppingcart.add(this.item);
		
		
	  return "Add";
  }
  
  public String search()
  {
	  ProductService productService= new ProductService();
	  try {
		this.searchList=productService.searchProduct(item.getUPC(),item.getTitle(),item.getCategory(),searchList);
	} catch (ConnectException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	  return "search";
  }
  
  public String AddSearchedItems()
  {
	  for(Item items: searchList)
	  {
		  if (checked.get(items.getUPC())) {
			  shoppingcart.add(items);
	        }
	  }
	
	

	
	  return "AddSearch";
  }
  
  public String validateShoppingCart()
  {
	  return "OrderConfirmation";
  }
  
  private boolean validateQuantity(Item item)
  {
	  return false;
  }
}

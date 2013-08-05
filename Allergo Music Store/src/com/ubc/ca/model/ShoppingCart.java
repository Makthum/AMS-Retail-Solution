package com.ubc.ca.model;

import java.io.IOException;
import java.net.ConnectException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;



import com.ubc.ca.exception.NoStockException;
import com.ubc.ca.exception.TooManyItemsFoundException;
import com.ubc.ca.service.ProductService;

public class ShoppingCart {

	
	private Item item= new Item();
	private Map<Long, Boolean> checked = new HashMap<Long, Boolean>();
	private String errorMessage=new String();
	private String paymentMethod=null;
	private float totalprice=0;
	
	
	public float getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(float totalprice) {
		this.totalprice = totalprice;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

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
        ProductService service= new ProductService();
        try {
        	
			Item item_temp=service.getItem(item.getCategory(),item.getTitle(),item.getLeadSinger(),item.getQuantity());
			if(item_temp.getQuantity()!=0)
			{
			totalprice=(item_temp.getPrice()* item_temp.getQuantity())+totalprice;
			shoppingcart.add(item_temp);
			this.errorMessage=item_temp.getErrorMessage();
					
			}
			else
			{
				this.errorMessage="Item Not Added. Please Specify Item Quantity More than 0";
			}
		} catch (ConnectException e) {
			// TODO Auto-generated catch block
			this.errorMessage=e.getMessage();
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			this.errorMessage=e.getMessage();
			e.printStackTrace();

		} catch (TooManyItemsFoundException e) {
			// TODO Auto-generated catch block
			this.errorMessage=e.getMessage();
			e.printStackTrace();

		} catch (NoStockException e) {
			// TODO Auto-generated catch block
			this.errorMessage="Requested Quantity Not Available. Quantity set to Available stock";
			e.printStackTrace();

		}
		  
		  
		
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

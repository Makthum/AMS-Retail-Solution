package com.ubc.ca.model;

import java.net.ConnectException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import com.ubc.ca.exception.NoStockException;
import com.ubc.ca.exception.TooManyItemsFoundException;
import com.ubc.ca.service.ProductService;

/**
 * 
 * @author Makthum This Model Class takes care searching and adding items to
 *         shopping cart. All the fields on Checkout.jsp are mapped to fields in
 *         this class.
 */

public class ShoppingCart {

	private Item item = new Item();

	// holds error messages for checkout page
	private String errorMessage = null;

	private boolean paymentMethod;
	private float totalprice = 0;

	// Hashmap to hold the selected items from item search
	private Map<Long, Boolean> checked = new HashMap<Long, Boolean>();

	// Holds all items on the shopping cart
	private ArrayList<Item> shoppingcart = new ArrayList<Item>();

	// Holds all the items return from the search
	private ArrayList<Item> searchList = new ArrayList<Item>();

	public float getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(float totalprice) {
		this.totalprice = totalprice;
	}

	public boolean isPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(boolean paymentMethod) {
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

	/**
	 * This method is invoked when AddtoCart button is clicked on checkout.jsp.
	 * This method takes care of searching the DB for items based on title or
	 * category or lead singer or all of them and adds them to shopping cart.
	 * This method also updates existing stock for that particular item once
	 * selected.
	 * 
	 * @return String : contains Action outcome for page navigation
	 */

	public String AddCart() {
		ProductService service = new ProductService();
		try {

			// if quantity mentioned on checkout.jsp is 0 display error message
			// without adding item to the shopping cart.

			if (item.getQuantity() != 0) {
				Item item_temp = service.getItem(item.getCategory(),
						item.getTitle(), item.getLeadSinger(),
						item.getQuantity());
				if (item_temp != null) {
					this.errorMessage = item_temp.getErrorMessage();
					totalprice = (item_temp.getPrice() * item_temp
							.getQuantity()) + totalprice;
					Item temp = hasItem(shoppingcart, item_temp);
					if (temp != null) {
						shoppingcart.remove(temp);
						temp.setQuantity(temp.getQuantity()
								+ item_temp.getQuantity());
						shoppingcart.add(temp);
					} else
						shoppingcart.add(item_temp);

				} else {
					this.errorMessage = "No Item Found ";
				}
			} else {
				this.errorMessage = " No Item Added . Please Specify Quantity More than 0";

			}
		} catch (ConnectException e) {
			this.errorMessage = e.getMessage();
			e.printStackTrace();
		} catch (SQLException e) {
			this.errorMessage = e.getMessage();
		} catch (TooManyItemsFoundException e) {
			this.errorMessage = e.getMessage();
		} catch (NoStockException e) {
			this.errorMessage = "Requested Quantity Not Available. Quantity set to Available stock";
		}

		return "Add";
	}

	/**
	 * This methods search items and directs to results.jsp page
	 * 
	 * @return String : Action outcome which determines page navigation
	 */
	public String search() {
		ProductService productService = new ProductService();

		try {
			if (this.item.getQuantity() != 0) {

				this.searchList = productService.searchProduct(
						item.getCategory(), item.getTitle(),
						item.getLeadSinger(), item.getQuantity(), searchList);
				if (this.searchList.size() == 0)
					this.errorMessage = "No items returned in Search";
				else
					this.errorMessage = "";
			} else {
				this.errorMessage = "Item Not Added. Please Specify Item Quantity More than 0";

			}
		} catch (ConnectException e) {
			this.errorMessage = e.getMessage();
		} catch (SQLException e) {
			this.errorMessage = e.getMessage();
		}

		return "search";
	}

	public String AddSearchedItems() {
		for (Item items : searchList) {
			if (checked.get(items.getUPC())) {

				totalprice = (items.getPrice() * this.item.getQuantity())
						+ totalprice;

				Item temp = hasItem(shoppingcart, items);
				if (temp != null) {
					shoppingcart.remove(temp);
					temp.setQuantity(temp.getQuantity() + items.getQuantity());
					shoppingcart.add(temp);
				} else
					shoppingcart.add(items);

			}
		}

		return "AddSearch";
	}

	public Item hasItem(ArrayList<Item> shpcart, Item item) {
		for (Item items : shpcart) {
			if (items.getUPC().equals(item.getUPC()))
				return items;
		}
		return null;
	}
	
	public String orderItems()
	{
		FacesContext facesContext = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) facesContext.getExternalContext()
				.getSession(false);

		// Session object holds current username
		String role = (String) session.getAttribute("role");
		if(role.equalsIgnoreCase("customer"))
			paymentMethod=false;
			else
				paymentMethod=true;
		return "checkout";

			
	}
}

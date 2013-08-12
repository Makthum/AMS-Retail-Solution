package com.ubc.ca.model;

import java.net.ConnectException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import com.ubc.ca.service.ProductService;

/**
 * 
 * @author Makthum This Model class is associated with order save and holds
 *         values for Order Confirmation page
 */

public class Purchase {

	/**
	 * These attributes corresponds to fields displayed on the order
	 * confirmation page
	 * 
	 */
	private String customerId;
	private float totalprice;
	private Date purchasedDate;
	private ArrayList<Item> shoppingCart = new ArrayList<Item>();
	private String receiptId;
	private String cardNo;
	private String expiryDate;
	private boolean isCardPayment;
	private String last5digit;
	private String expectedDate;
	private boolean paymentMethod;
	

	public String getLast5digit() {
		return last5digit;
	}

	public void setLast5digit(String last5digit) {
		this.last5digit = last5digit;
	}

	public String getExpectedDate() {
		return expectedDate;
	}

	public void setExpectedDate(String expectedDate) {
		this.expectedDate = expectedDate;
	}

	private String paymentType;
	// Error Message for Order Confirmation Page
	private String errorMessage;

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

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public boolean isCardPayment() {
		return isCardPayment;
	}

	public boolean isPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(boolean paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public void setCardPayment(boolean isCardPayment) {
		this.isCardPayment = isCardPayment;
	}

	/**
	 * This method is invoked when pay button is clicked. This method populates
	 * the fields on the Order confirmation page and creates a new order
	 * ,retrieves receiptId from back end and displays it.
	 * 
	 * @return String : returns Action outcome based on which page navigation is
	 *         decided
	 */

	public String generateOrder() {

		FacesContext facesContext = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) facesContext.getExternalContext()
				.getSession(false);

		// Session object holds current username
		String userId = (String) session.getAttribute("username");
		String role=(String)session.getAttribute("role");

		ProductService service = new ProductService();

		try {
			if(role.equalsIgnoreCase("customer"))
			this.customerId = userId;
			else
			this.customerId=null;
			service.updateStock(shoppingCart);
			String result[] = service.saveOrder(totalprice, customerId,
					paymentType, cardNo, expiryDate,expectedDate);
			this.receiptId=result[0];
			this.expectedDate=result[1];
           System.out.println(expectedDate);
			this.purchasedDate = new Date(System.currentTimeMillis());
			if(cardNo!=null)
			this.last5digit=cardNo.substring(cardNo.length()-5,cardNo.length());
			service.savePurchasedItems(shoppingCart,
					Integer.parseInt(receiptId));

		} catch (ConnectException e) {
			// TODO Auto-generated catch block
			this.errorMessage = e.getMessage();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			this.errorMessage = e.getMessage();
		}
		return "orderConfirmation";
	}

	public String Payment() {
		if (this.paymentType.equalsIgnoreCase("card"))
			return "CardInfoPage";
		else

			return generateOrder();
	}

}

package com.ubc.ca.service;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ubc.ca.exception.NoStockException;
import com.ubc.ca.exception.TooManyItemsFoundException;
import com.ubc.ca.model.Item;

public class ProductService {
	
	public ArrayList<Item> searchProduct(String UPC, String category,String title,ArrayList<Item> searchList) throws ConnectException
	{
		Connection con=ConnectionService.getConnection();
		String query="select * from \"Login\" where \"UPC\"=? or \"Category\"=? or \"title\"=? ";
		PreparedStatement preparestatement;
		searchList=null;
		searchList= new ArrayList<Item>();
		try {
			preparestatement = con.prepareStatement(query);
			preparestatement.setString(1, UPC);
		//	ResultSet rs=preparestatement.executeQuery();
			/* Dummy values for now */
			Item item=new Item();
			item.setCategory("test");
			item.setQuantity(1);
			item.setTitle("test");
			item.setUPC("111");
		
			searchList.add(item);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return searchList;
		
	}
	
	public Item getItem(String UPC, String category,String title,int quantity) throws ConnectException , SQLException, TooManyItemsFoundException, NoStockException
	{
		System.out.println("getItem");
		Item item = null;
		Connection con=ConnectionService.getConnection();
		String query=null;
		PreparedStatement query_ps=null;
		if(!(UPC.equals("")||null==UPC||category.equals("")||null==category|| title.equals("")||null==title))
		{
			
		query="SELECT item.upc,title,item_stock FROM item where item.upc=? or item.title=? or item_category=?";
			
			
		query_ps= con.prepareStatement(query);
		query_ps.setString(1, UPC);
		query_ps.setString(2, title);
		query_ps.setString(3, category);
		 ResultSet rs=query_ps.executeQuery();
		 if(rs!=null)
		 {
		    rs.next();
		   
		    	item=new Item();
		    	item.setCategory(category); 
		    	item.setQuantity(rs.getInt(3));
		    	item.setTitle(rs.getString(2));
		    	item.setUPC(Integer.toString(rs.getInt(1)));
		   
		  if(item.getQuantity()<quantity)
			  throw new NoStockException();
		  else
		  {
			  
			  query="update item set item_stock=? where upc=?";
			  query_ps= con.prepareStatement(query);
			  int j=item.getQuantity()-quantity;
			  System.out.println(j);
			  item.setQuantity(quantity);
				query_ps.setInt(1,j);
				query_ps.setString(2,item.getUPC());

				int i =query_ps.executeUpdate();
				System.out.println(i);
				
		  }
		}
		
		}
		
		
		con.commit();
		return item;
	}
    
	public List getItemList(String category, String title)
	{
		ArrayList<Item> searchedItems= new ArrayList<Item>();
		return searchedItems;
	}
	
	public Item addItemtoCart(Item item) throws NoStockException
	{
		
		return item;
	}
}

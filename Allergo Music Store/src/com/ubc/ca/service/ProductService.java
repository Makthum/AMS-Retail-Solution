package com.ubc.ca.service;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ubc.ca.exception.NoStockException;
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
	
	public Item getItem(String UPC, String category,String title) throws ConnectException , SQLException
	{
		Item item = new Item();
		Connection con=ConnectionService.getConnection();
		String query=null;
		PreparedStatement query_ps=null;
		if(!(UPC.equals("")||null==UPC||category.equals("")||null==category|| title.equals("")||null==title))
		{
		query="SELECT * FROM ITEM where upc=? or category=? or title=?";
		query_ps= con.prepareStatement(query);
		query_ps.setString(1, UPC);
		query_ps.setString(2, category);
		query_ps.setString(3, title);
		}
		if(!(UPC.equals("")||null==UPC||title.equals("")||null==title))
		{
			query="SELECT * FROM ITEM where upc=? or  title=?";
			query_ps= con.prepareStatement(query);
			query_ps.setString(1, UPC);
			query_ps.setString(2, title);
			
		}
	    ResultSet rs=query_ps.executeQuery();
	    
		
		
		
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

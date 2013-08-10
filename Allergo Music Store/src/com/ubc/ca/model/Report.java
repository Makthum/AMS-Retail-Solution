package com.ubc.ca.model;

import java.net.ConnectException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.ubc.ca.service.ReportService;

public class Report {
	
	private String date;
	private int number_items;
	private ArrayList<Item> dailyReport= new ArrayList<Item>();
	private ArrayList<Item> TopItem_Report= new ArrayList<Item>();
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getNumber_items() {
		return number_items;
	}
	public void setNumber_items(int number_items) {
		this.number_items = number_items;
	}
	public ArrayList<Item> getDailyReport() {
		return dailyReport;
	}
	public void setDailyReport(ArrayList<Item> dailyReport) {
		this.dailyReport = dailyReport;
	}
	public ArrayList<Item> getTopItem_Report() {
		return TopItem_Report;
	}
	public void setTopItem_Report(ArrayList<Item> topItem_Report) {
		TopItem_Report = topItem_Report;
	}
	 public String dailySalesReport()
	   {
		   ReportService service;
		try {
			service = new ReportService();
			 SimpleDateFormat date= new SimpleDateFormat("dd/MM/yyyy");
			   java.util.Date temp_date=date.parse(this.date);
			   this.dailyReport=(ArrayList<Item>)service.generateDailySalesReport(temp_date);
		} catch (ConnectException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return "success";
	   }

	 public String TopnNSalesReport()
	   {
		   ReportService service;
		try {
			service = new ReportService();
			 SimpleDateFormat date= new SimpleDateFormat("dd/MM/yyyy");
			   java.util.Date temp_date=date.parse(this.date);
			   this.TopItem_Report=(ArrayList<Item>)service.generateTopSellersReport(temp_date,number_items);
		} catch (ConnectException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return "success";
	   }

}

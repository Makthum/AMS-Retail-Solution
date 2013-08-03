package com.ubc.ca.service;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionService {
	
	public static Connection getConnection() throws ConnectException
	{
		Connection con=null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@dbhost.ugrad.cs.ubc.ca:1522:ug","ora_p3t8","a71541122");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			throw new ConnectException(e.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new ConnectException(e.getMessage());
		}
		return con;
		
	}

}

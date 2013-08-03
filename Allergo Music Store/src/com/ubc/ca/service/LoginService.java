package com.ubc.ca.service;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginService {

	public String authenticate(String userName, String password) throws ConnectException
	{
		try {
			Connection con=ConnectionService.getConnection();
			String query="select * from Login where username=?";
			PreparedStatement preparestatement=con.prepareStatement(query);
			preparestatement.setString(1, userName);
			ResultSet rs=preparestatement.executeQuery();
			if(null!=rs)
			{
				rs.next();
				if(rs.getString(2).equals(password))
				return rs.getString(3);
				else 
					return "failure";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new ConnectException(e.getMessage());
		}
		
		
			return "failure";
	}
}

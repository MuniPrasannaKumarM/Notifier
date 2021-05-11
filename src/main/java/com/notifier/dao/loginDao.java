package com.notifier.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.notifier.model.loginBean;

public class loginDao {
	private int result = 0;
	public Boolean checkIfExist(loginBean l) throws ClassNotFoundException, SQLException {
		try {
		
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
		PreparedStatement preparedStatement = con
				.prepareStatement("select email,password from userdetails where email = ? and password = ? ");
	preparedStatement.setString(1, l.getEmail());
//	Statement stmt = con.createStatement();
	preparedStatement.setString(2, l.getPassword());
	System.out.println(l.getEmail()+" "+l.getPassword());
	ResultSet rs = preparedStatement.executeQuery();
	if(rs.next()) {
		System.out.println(rs.getString("email"));
		System.out.println(rs.getString("password"));
		return true;
	}
	else
	{
		return false;
	}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		//
		return true;	
	}
	public String getEmail(loginBean l) throws SQLException, ClassNotFoundException {
		
		return l.getEmail();
	}
	public String getName(loginBean l) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
		PreparedStatement preparedStatement = con
				.prepareStatement("select name from userdetails where email = ? and password = ? ");
		preparedStatement.setString(1, l.getEmail());
//	Statement stmt = con.createStatement();
		preparedStatement.setString(2, l.getPassword());
		String name = "";
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next())
		{
			name = rs.getString("name");
		}
	return name;
	}
}

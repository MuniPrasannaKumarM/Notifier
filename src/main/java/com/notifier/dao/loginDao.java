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
		System.out.println(rs.getString(0));
		System.out.println(rs.getString(1));
//		return true;
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
	
}

package com.notifier.dao;
import java.sql.*;

import com.notifier.model.SignUpBean;
public class signUpDao {
	private int result =0;
	public int signupme(SignUpBean s) throws ClassNotFoundException, SQLException
	{
		
		String INSERT_USERS_SQL = "INSERT INTO userdetails" +
	            "  (name, username, mobile, email, password) VALUES " +
	            " (?, ?, ?, ?, ?);";
		try {
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
				PreparedStatement preparedStatement = con.prepareStatement(INSERT_USERS_SQL);
				preparedStatement.setString(1,s.getName());
				preparedStatement.setString(2, s.getUsername());
				preparedStatement.setString(3, s.getMobile());
				preparedStatement.setString(4, s.getEmail());
				preparedStatement.setString(5, s.getPassword());
				result = preparedStatement.executeUpdate();
				System.out.println(result);			
		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return result;
		
	}
}

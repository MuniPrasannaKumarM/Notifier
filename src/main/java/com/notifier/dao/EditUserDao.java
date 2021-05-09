package com.notifier.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.notifier.model.SignUpBean;

public class EditUserDao {
	public SignUpBean user(String email) throws ClassNotFoundException, SQLException {
		SignUpBean s = new SignUpBean();
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
		PreparedStatement preparedStatement = con
				.prepareStatement("select * from userdetails where email = ? ");
	preparedStatement.setString(1,email);
	ResultSet rs = preparedStatement.executeQuery();
	if(rs.next()) {
		s.setName(rs.getString("name"));;
		s.setUsername(rs.getString("username"));
		s.setMobile(rs.getString("mobile"));
		s.setEmail(rs.getString("email"));
		s.setPassword(rs.getString("password"));
	}
		return s;
		
	}
	public int updateUser(String name,String username,String email,String mobile,String password) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
		String query = "update userdetails SET name=?,username=?,mobile=?,password=? where email = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, name);
		pstmt.setString(2, username);
		pstmt.setString(3, mobile);
		pstmt.setString(4, password);
		pstmt.setString(5, email);
		int rowAffected = pstmt.executeUpdate();
		return rowAffected;
		
	}
}

package com.notifier.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class newnoteDao {
	public int newnote(String email,String notename,String notebookname, String start,String end,String remainder,String status,String tag,String desc) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
		String query = "Insert into notes values (?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, email);
		pstmt.setString(2, notename);
		pstmt.setString(3, notebookname);
		System.out.println("Start "+start+" Status"+status);
		
		pstmt.setString(4, start);
		pstmt.setString(5, end);
		pstmt.setString(6, remainder);
		pstmt.setString(7, status);
		pstmt.setString(8, tag);
		pstmt.setString(9, desc);
		
	
		
		int rowAffected = pstmt.executeUpdate();
		
		String query1 = "select * from notebooks where notebookname= '"+notebookname+"'";
		PreparedStatement pstmt1 = con.prepareStatement(query1);
		
		ResultSet rs = pstmt1.executeQuery(query1);
		int count = 0;
		while(rs.next()) {
			count = rs.getInt("notes");
		}
		count+=1;
		System.out.println("count  "+count);
		String query2 = "Update notebooks set notes = ? where notebookname = ?";
		PreparedStatement pstmt2 = con.prepareStatement(query2);
		pstmt2.setInt(1, count);
		pstmt2.setString(2, notebookname);
		int affected = pstmt2.executeUpdate();
		return rowAffected;
		
	}
}

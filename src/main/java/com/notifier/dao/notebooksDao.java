package com.notifier.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class notebooksDao {
	public ArrayList<String> getNoteBook(String email) throws ClassNotFoundException, SQLException {
		ArrayList<String> notebooknames = new ArrayList<String>();
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
//		PreparedStatement preparedStatement = con
//				.prepareStatement("select * from notebooks where email = 'm.muniprasanna@gmail.com'");
//		preparedStatement.setString(0, email);
		String query = "select * from notebooks where email = '"+email+"'";
		Statement stmt = con.createStatement();
		//where email = 'm.muniprasanna@gmail.com'"
        ResultSet rs = stmt.executeQuery(query);
//		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()) {
			notebooknames.add(rs.getString("notebookname"));
//			System.out.println(rs.getString("notebookname"));
//			System.out.println(rs.getInt(1));
//			System.out.println(rs.getString(2));
//			System.out.println("coming");
		}
		return notebooknames;
	}
	public  ArrayList<Integer> getNotesCount(String email) throws ClassNotFoundException, SQLException {
		ArrayList<Integer> count = new ArrayList<Integer>();
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
//		PreparedStatement preparedStatement = con
//				.prepareStatement("select notes from notebooks where email = ?");
//		preparedStatement.setString(0, email);
		String query = "select * from notebooks where email = '"+email+"'";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
//		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next()) {
			count.add(rs.getInt("notes")) ;
		}
		return count;
	}
	public int editNoteBook(String oldnotename, String newnotename) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
		String query = "update notebooks SET notebookname = ? where notebookname = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, newnotename);
		pstmt.setString(2, oldnotename);
		int rowAffected = pstmt.executeUpdate();
		return rowAffected;
	}
	public int addNoteBook( String notename,String email) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
		String query = "Insert into notebooks values(?,0,?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, notename);
		pstmt.setString(2, email);
		int rowAffected = pstmt.executeUpdate();
		return rowAffected;
	}
	public int deleteNoteBook( String notename) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
		String query = "Delete from notebooks where notebookname= ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, notename);
		
		int rowAffected = pstmt.executeUpdate();
		return rowAffected;
	}

}

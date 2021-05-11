package com.notifier.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.notifier.model.notes;

public class all_notes_Dao {
	public ArrayList<notes> getNotes(String email) throws ClassNotFoundException, SQLException
	{
		ArrayList<notes> note = new ArrayList<notes>();
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
		String query = "Select * from notes where email = '"+email+"'";
		Statement stmt = con.createStatement();
		
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next())
        {
        	notes n = new notes();
        	n.setName(rs.getString("notename"));
        	n.setEmail(rs.getString("email"));
        	n.setNotebookname(rs.getString("notebookname"));
        	n.setStartdate(rs.getString("startdate"));
        	n.setEnddate(rs.getString("enddate"));
        	n.setRemainderdate(rs.getString("remainderdate"));
        	n.setStatus(rs.getString("status"));
        	n.setTag(rs.getString("tag"));
        	n.setDescription(rs.getString("description"));
        	note.add(n);
        }
		return note;
	}
	public ArrayList<notes> getNotes(String email,String notebook) throws ClassNotFoundException, SQLException
	{
		ArrayList<notes> note = new ArrayList<notes>();
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
		String query = "Select * from notes where email = '"+email+"' and notebookname = '"+notebook+"'";
		Statement stmt = con.createStatement();
		
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next())
        {
        	notes n = new notes();
        	n.setName(rs.getString("notename"));
        	n.setEmail(rs.getString("email"));
        	n.setNotebookname(rs.getString("notebookname"));
        	n.setStartdate(rs.getString("startdate"));
        	n.setEnddate(rs.getString("enddate"));
        	n.setRemainderdate(rs.getString("remainderdate"));
        	n.setStatus(rs.getString("status"));
        	n.setTag(rs.getString("tag"));
        	n.setDescription(rs.getString("description"));
        	note.add(n);
        }
		return note;
	}
	
	public int editNote(String email,String oldnotename,String newnotename,String notebookname, String start,String end,String remainder,String status,String tag,String desc) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
		String query = "update notes SET notename = ?,startdate =?,enddate=?,remainderdate=?,status=?,tag=?,description=? where notebookname = ? and email=? and notename=?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, newnotename);
		pstmt.setString(2, start);
		pstmt.setString(3, end);
		pstmt.setString(4, remainder);
		pstmt.setString(5, status);
		pstmt.setString(6, tag);
		pstmt.setString(7, desc);
		pstmt.setString(8, notebookname);
		pstmt.setString(9, email);
		pstmt.setString(10, oldnotename);
		int rowAffected = pstmt.executeUpdate();
		
		return rowAffected;
		
	}
	public int deleteNote(String email,String notename) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","root");
		String query = "Delete from notes where notename= ? and email=?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, notename);
		pstmt.setString(2, email);
		int rowAffected = pstmt.executeUpdate();
		return rowAffected;
		
	}
}

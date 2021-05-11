package com.notifier.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notifier.dao.all_notes_Dao;
import com.notifier.model.notes;

/**
 * Servlet implementation class allnotes
 */
@WebServlet("/notes")
public class allnotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public allnotes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    String email = "";
	public  String emailme(String email) {
		this.email = email;
    	return this.email;
    } 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		ArrayList<notes> note = new ArrayList<notes>();
		ArrayList<notes> note1 = new ArrayList<notes>();
		ArrayList<notes> remaindernotes = new ArrayList<notes>();
		all_notes_Dao a = new all_notes_Dao();
		LocalDate date = LocalDate.now();
		HttpSession session=request.getSession(false);  
	    String name=(String)session.getAttribute("name");
	    String email1 = (String)session.getAttribute("email");
	    allnotes an = new allnotes();
	    email = an.emailme(email1);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String nbname = request.getParameter("nbname");
		System.out.println("notebook "+nbname);
		String dateme = date.format(formatter);
			try {
				note1 = a.getNotes(email,nbname);
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		try {
			note = a.getNotes(email);
			for(notes noteme:note)
			{
				String d = noteme.getRemainderdate();
				
				if(d.equals(dateme))
				{
					
					remaindernotes.add(noteme);
				}
				
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if((!(nbname == null)))
		{
			request.setAttribute("notes", note1);
			request.setAttribute("notebooknameme", nbname);
		}
		else
		{
			request.setAttribute("notes", note);
		}
		request.setAttribute("name", name);
		request.setAttribute("remaindernotes", remaindernotes);
		request.setAttribute("notify", remaindernotes.size());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/all_notes.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String search = request.getParameter("search");
		
		if(search!=null)
		{
			
			ArrayList<notes> note = new ArrayList<notes>();
		ArrayList<notes> searchnote = new ArrayList<notes>();
		ArrayList<notes> remaindernotes = new ArrayList<notes>();
		all_notes_Dao a = new all_notes_Dao();
		LocalDate date = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		HttpSession session=request.getSession(false);  
	    String name=(String)session.getAttribute("name");
	    String email1 = (String)session.getAttribute("email");
	    allnotes an = new allnotes();
	    email = an.emailme(email1);
		String dateme = date.format(formatter);
		try {
			note = a.getNotes(email);
			for(notes noteme:note)
			{
				String d = noteme.getRemainderdate();
				String s = noteme.getName();
				if(s.equals(search))
				{
					searchnote.add(noteme);
				}
				if(d.equals(dateme))
				{
					
					remaindernotes.add(noteme);
				}
				
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("name", name);
		request.setAttribute("notes", searchnote);
		request.setAttribute("remaindernotes", remaindernotes);
		request.setAttribute("notify", remaindernotes.size());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/all_notes.jsp");
		dispatcher.forward(request, response);
		}
		String checkeditNotebook = request.getParameter("editnoteme");
		if((!(checkeditNotebook == null)) && checkeditNotebook.equals("edit")) {
			
			String notebook = request.getParameter("notebookname");
			String notetochange = request.getParameter("notename1");
			String email = request.getParameter("email");
			String newnote = request.getParameter("notename");
			String startdate = request.getParameter("sdate");
			String enddate = request.getParameter("edate");
			String remainderdate = request.getParameter("rdate"); 
			String status = request.getParameter("status");
			String tag = request.getParameter("tag");
			String desc = request.getParameter("desc");
			System.out.println(notebook+" "+notetochange+" "+email);
			System.out.println(newnote+" "+startdate+" "+enddate+" "+remainderdate+" "+status+" "+tag+" "+desc);
			all_notes_Dao a = new all_notes_Dao();
			try {
				a.editNote( email, notetochange, newnote, notebook,  startdate, enddate, remainderdate, status, tag, desc);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String deletecheck = request.getParameter("deletemeornot");
		if((!(deletecheck == null)) && deletecheck.equals("delete")) {
			
			String deletenote = request.getParameter("deletenoteme");
			String deleteemail = request.getParameter("deleteemailme");
			all_notes_Dao a = new all_notes_Dao();
			try {
				a.deleteNote(deleteemail, deletenote);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("delete "+deletecheck+" "+deletenote+" "+deleteemail);
		}
		doGet(request,response);
	}

}


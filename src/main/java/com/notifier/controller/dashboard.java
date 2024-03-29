package com.notifier.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
 * Servlet implementation class dashboard
 */
@WebServlet("/dashboard")
public class dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dashboard() {
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
		HttpSession session=request.getSession(false);  
	    String name=(String)session.getAttribute("name");
	    String email1 = (String)session.getAttribute("email");
	    dashboard d1 = new dashboard();
	    email = d1.emailme(email1);
	    
		ArrayList<notes> note = new ArrayList<notes>();
		ArrayList<notes> note1 = new ArrayList<notes>();
		ArrayList<notes> remaindernotes = new ArrayList<notes>();
		all_notes_Dao a = new all_notes_Dao();
		LocalDate date = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		Date current = null;
		String dateme = date.format(formatter);
		try {
			 current= sdformat.parse(dateme);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	      
		
		try {
			note = a.getNotes(email);
			System.out.println("dashboard   "+email);
			for(notes noteme:note)
			{
				String d = noteme.getRemainderdate();
				Date start = sdformat.parse(noteme.getStartdate());
				Date end = sdformat.parse(noteme.getEnddate());
				
				
				if(current.compareTo(start)>=0 && current.compareTo(end)<=0) {
					note1.add(noteme);
					System.out.println("name "+noteme.getName());
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
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			request.setAttribute("notes", note1);
		
		request.setAttribute("name", name);
		request.setAttribute("remaindernotes", remaindernotes);
		request.setAttribute("notify", remaindernotes.size());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/dashboard.jsp");
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
		request.setAttribute("notes", searchnote);
		request.setAttribute("remaindernotes", remaindernotes);
		request.setAttribute("notify", remaindernotes.size());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/dashboard.jsp");
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

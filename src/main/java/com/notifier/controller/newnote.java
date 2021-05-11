package com.notifier.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notifier.dao.newnoteDao;

/**
 * Servlet implementation class newnote
 */
@WebServlet("/newnote")
public class newnote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newnote() {
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
		String nbname = request.getParameter("nbname");
		HttpSession session=request.getSession(false);  
	    String name=(String)session.getAttribute("name");
	    String email1 = (String)session.getAttribute("email");
	    newnote newnot = new newnote();
	    email = newnot.emailme(email1);
		if((!(nbname == null)))
		{
			request.setAttribute("nbname", nbname);
			System.out.println("nbname "+nbname);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/newnote.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String notebookname = request.getParameter("notebookname");
		String notename = request.getParameter("notename");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String remainder = request.getParameter("remainder");
		String status = request.getParameter("status");
		
		String tag = request.getParameter("tag");
		String desc = request.getParameter("desc");
		newnoteDao newnote = new newnoteDao();
		HttpSession session=request.getSession(false);  
	    String name=(String)session.getAttribute("name");
	    String email1 = (String)session.getAttribute("email");
		newnote newnot = new newnote();
		
	    email = newnot.emailme(email1);
		try {
			newnote.newnote(email, notename, notebookname, start, end, remainder, status, tag, desc);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
String nbname = request.getParameter("nbname");
		
		if((!(nbname == null)))
		{
			response.sendRedirect("/Notifier/notebooks");
		}
		else
		{
			response.sendRedirect("/Notifier/notebooks");
		}
	}

}


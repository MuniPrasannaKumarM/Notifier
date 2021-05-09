package com.notifier.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notifier.dao.notebooksDao;

/**
 * Servlet implementation class NoteBooks
 */
@WebServlet("/notebooks")
public class NoteBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	String email = "m.muniprasanna@gmail.com";
    public NoteBooks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/notebook_page.jsp");
		
		
		ArrayList<Integer> count = new ArrayList<Integer>(); 
		ArrayList<String> notebook = new ArrayList<String>();
		notebooksDao n = new notebooksDao();
		try {
			notebook = n.getNoteBook(email);
			
			count = n.getNotesCount(email);
			System.out.println(notebook+" "+count);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("notebooks", notebook);
		request.setAttribute("count", count);
		request.setAttribute("length", notebook.size());
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		notebooksDao n = new notebooksDao();
		String checkaddNotebook = request.getParameter("notevalue");
		if(!(checkaddNotebook == null) && checkaddNotebook.equals("add"))
		{	
			
			String addnotevalue = request.getParameter("addNotebook");
			System.out.println(addnotevalue+" "+checkaddNotebook);
			try {
				n.addNoteBook(addnotevalue, this.email);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String checkeditNotebook = request.getParameter("editnotebookme");
		if((!(checkeditNotebook == null)) && checkeditNotebook.equals("edit"))
		{
			String editnotevalue = request.getParameter("editnotebook");
			String editnewnotevalue = request.getParameter("newnotebook");
			System.out.println(editnotevalue+" "+checkeditNotebook+" "+editnewnotevalue);
			try {
				n.editNoteBook(editnotevalue, editnewnotevalue);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String deletecheck = request.getParameter("deletemeornot");
		if((!(deletecheck == null)) && deletecheck.equals("delete"))
		{
			String deletenotebook = request.getParameter("deletenotebookme");
			System.out.println(deletecheck+" "+deletenotebook);
			try {
				n.deleteNoteBook(deletenotebook);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.sendRedirect("/Notifier/notebooks");
	}

}

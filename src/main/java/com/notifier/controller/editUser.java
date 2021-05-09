package com.notifier.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notifier.dao.EditUserDao;
import com.notifier.model.SignUpBean;

/**
 * Servlet implementation class editUser
 */
@WebServlet("/edituser")
public class editUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/editUser.jsp");
		EditUserDao ed = new EditUserDao();
		SignUpBean s = null;
		try {
			 s= ed.user("m.muniprasanna@gmail.com");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("name", s.getName());
		request.setAttribute("username", s.getUsername());
		request.setAttribute("mobile", s.getMobile());
		request.setAttribute("email", s.getEmail());
		request.setAttribute("password", s.getPassword());
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		System.out.println("Email  "+email);
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		EditUserDao ed = new EditUserDao();
		try {
			ed.updateUser(name, username, email, mobile, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doGet(request,response);
	}

}

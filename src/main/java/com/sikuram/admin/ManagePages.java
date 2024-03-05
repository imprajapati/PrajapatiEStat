package com.sikuram.admin;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sikuram.database.DbConnection;
import com.sikuram.login.Users;

/**
 * Servlet implementation class ManagePages
 */
@WebServlet("/ManagePages")
public class ManagePages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	Connection con;
	DbConnection dbConnection;
	Users curreUsers;
	
	
    public ManagePages() {
        super();
        // TODO Auto-generated constructor stub
        
        try {
			con =dbConnection.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession();
		curreUsers = (Users) session.getAttribute("user");
		
		System.out.println("User ===> "+curreUsers.getName());
		String action = request.getParameter("action");
		
		int i = 0;
		
		switch(action) {
		case "showList":
			showList(request, response);
			break;
			
			default:
				break;
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		HttpSession session = request.getSession();
		curreUsers = (Users) session.getAttribute("user");
		
		System.out.println("Users ===> "+curreUsers.getName());
		
		String action = request.getParameter("action");
		
		int i =0;
		
		switch (action) {
		case "showList": {
			showList(request, response);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + action);
		}
	}

	public void showList(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	

}

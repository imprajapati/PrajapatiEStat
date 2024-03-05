package com.sikuram.login;
import com.sikuram.login.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;

import com.sikuram.database.DbConnection;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Connection con;
	
	DbConnection dbConnection;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        
        try {
			con = dbConnection.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
		}
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/* doGet(request, response); */
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		Users user = new Users();
		
		user.setEmail(email);
		user.setPwd(pwd);
		
		try {
			
			 if (con == null) {
	                // Handle the case where the connection is not initialized
	                throw new SQLException("Connection is null");
	            }else {
			boolean validate = user.validateUser(con);
			
			System.out.println("Validated User ===>" + validate);
			HttpSession session = request.getSession(true);
			
			if(validate) {
			Users currentUser = user.getUser(con);	
			session.setAttribute("user", currentUser);
			
			System.out.println("CurrentUser" + currentUser.getName());
			
			RequestDispatcher rd = request.getRequestDispatcher("/ManagePages?action=showList");
			rd.forward(request, response);
			
			}else {
				System.out.println("Invalid User");
				   session.invalidate();
				   
				   request.setAttribute("errormsg", "*Invalid Email Id or Password*");
				
				RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
				
				rd.forward(request, response);
			}
	            }
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
}

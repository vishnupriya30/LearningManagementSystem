package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.dto.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		//gets the details from login form
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username+" "+password);
		User user= new User();
		try{
			System.out.println("hello world");
	    user = UserDao.getUser(username);
		session.setAttribute("user", user);
		}catch(NullPointerException e){
			RequestDispatcher rd = request.getRequestDispatcher("login.html");
			rd.include(request, response);	
		}try{
		//validates user and if credentials are correct, user gets redirected to Homepage
		if(user!=null && (user.getPassword().equals(password))){
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			System.out.println("User is validated");
			int userId = user.getUserId();
			session.setAttribute("userId", userId);
			RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
			rd.include(request, response);
		}
		else
			{
				//if credentials are wrong, user gets redirected to ErrorPage
				RequestDispatcher rd = request.getRequestDispatcher("ErrorPage.jsp");
				rd.forward(request, response);
			}
		}catch(Exception e){
			System.out.println("Error:"+e);
			RequestDispatcher rd = request.getRequestDispatcher("login.html");
			rd.include(request, response);	
		}
			
		out.println("</html>");		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

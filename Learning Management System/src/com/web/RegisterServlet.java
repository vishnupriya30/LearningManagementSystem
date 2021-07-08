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


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		//gets the details from register form
		String userName = request.getParameter("userName");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String password = request.getParameter("password");
		String registerNo = request.getParameter("registerNo");
		String emailId = request.getParameter("email");
		User user1 = new User();
		String error = "";
		try{
		//checks if userName exists
		user1 = (User)UserDao.getUser(userName);
		System.out.println("user exists"+user1.getUserId());
		error = "Username already exists!";
		session.setAttribute("error",error);
		RequestDispatcher rd = request.getRequestDispatcher("RegError.jsp");
		rd.include(request, response);
		return;
		}
		catch(Exception e){
			System.out.println(e);
		}
		try{
			//checks if the user with that registerNo is already registered
			user1 = (User)UserDao.getUserByRegisterNo(registerNo);
			error = "Account is already created with this registerNo";
			session.setAttribute("error",error);
			RequestDispatcher rd = request.getRequestDispatcher("RegError.jsp");
			rd.include(request, response);
			return;
		}
		catch(Exception e){
			System.out.println(e);
		}
		//if length of the password is less than 6 characters
		if(password.length() < 6){
			error = "Password should be atleast 6 characters!!";
			session.setAttribute("error",error);
			RequestDispatcher rd = request.getRequestDispatcher("RegError.jsp");
			rd.include(request, response);
		}
		else if(password.length() > 15){
			//if length of the password is more than 15 characters
			error = "Password limit exceeded!!";
			session.setAttribute("error",error);
			RequestDispatcher rd = request.getRequestDispatcher("RegError.jsp");
			rd.include(request, response);
		}
		else{
		User user = new User(registerNo,firstName,lastName,userName, password,emailId); 
		UserDao userdao = new UserDao();
		//adds a new entry into user table by invoking register table and redirects to login page
		int x = userdao.register(user);
		if(x > 0){
		RequestDispatcher rd = request.getRequestDispatcher("login.html");
		rd.include(request, response);
	    }
		else{
			RequestDispatcher rd = request.getRequestDispatcher("Register.html");
			rd.include(request, response);
		}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

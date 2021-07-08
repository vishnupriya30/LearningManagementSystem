/*This servlet is responsible to create a new class and
 * add entry into the class table
 */
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

import com.dto.Class;
import com.dao.ClassDao;
import com.dao.UserDao;
import com.dto.User;

@WebServlet("/CreateClassServlet")
public class CreateClassServlet extends HttpServlet {
	private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	//generates a random class code of length 8
	public static String randomAlphaNumeric(int count) {
	StringBuilder builder = new StringBuilder();
	while (count-- != 0) {
	int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
	builder.append(ALPHA_NUMERIC_STRING.charAt(character));
	}
	return builder.toString();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		//gets className and subjectName from the create class form
		String subjectName = request.getParameter("subjectName");
		String className = request.getParameter("className");
		System.out.println(subjectName);
		User user= new User();
		String username = (String) session.getAttribute("username");
		try{
			System.out.println("create class servlet");
	    user = UserDao.getUser(username);
	    String facultyName = user.getFirstName()+" "+user.getLastName();
	    int userId = user.getUserId();
	    String classCode = randomAlphaNumeric(8);
	    System.out.println("FacultyName:"+facultyName);
	    System.out.println(" UserId:"+userId);
	    System.out.println(" Classcode:"+classCode);
		session.setAttribute("user", user);
		//A class object is created with the details entered by user
		Class classroom = new Class(facultyName,subjectName,className,classCode,userId); 
		ClassDao classDao = new ClassDao();
		//A new entry is added into the class table
		int x = classDao.register(classroom);
		if(x > 0){
		//redirects to Homepage
		RequestDispatcher rd = request.getRequestDispatcher("CreateClass.jsp");
		rd.include(request, response);
		System.out.println("Class created with code:"+classCode);
	    }
		}catch(NullPointerException e){
			RequestDispatcher rd = request.getRequestDispatcher("CreateClass.jsp");
			rd.include(request, response);	
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

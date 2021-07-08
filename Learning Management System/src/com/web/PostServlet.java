/*This servlet is responsible to add a new entry in the post table.
 * It is invoked when user sends a public announcement or private message
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

import com.dao.PostDao;
import com.dao.UserDao;
import com.dto.Class;
import com.dto.Post;
import com.dto.User;

@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		//gets the details from the announcement form
		String message = request.getParameter("message");
		String to = request.getParameter("to");
		User user = new User();
		//UserId of the user who is sending message
		int fromUserId = (int) session.getAttribute("userId");
		Post post = null;
		String date = (java.time.LocalDate.now()).toString();
		//checks whether sender sending to whole class or a specific user
		if(to.equals("All Members")){
			Class classroom = (Class) session.getAttribute("classroom");
			int toClassId = (int)classroom.getClassId();
			//if the message is for whole class,then toUserId is set to 0
			post = new Post(message,fromUserId,0,toClassId,date);
		}
		else{
			String[] details = to.split("-");
			user = UserDao.getUserByRegisterNo(details[0]);
			int toUserId = (int)user.getUserId();
			Class classroom = (Class) session.getAttribute("classroom");
			int toClassId = (int)classroom.getClassId();
			post = new Post(message,fromUserId,toUserId,toClassId,date);
		}
		PostDao postDao = new PostDao();
		//adds a new entry into the post table
		int x = postDao.register(post);
		if(x > 0){
		//redirects to Classroom page
		RequestDispatcher rd = request.getRequestDispatcher("Classroom.jsp");
		rd.include(request, response);
	    }
		else{
			RequestDispatcher rd = request.getRequestDispatcher("Classroom.jsp");
			rd.include(request, response);
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

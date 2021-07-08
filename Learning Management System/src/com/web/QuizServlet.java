/*This servlet is responsible to add a new entry in the quiz table
 * 
 */
package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.QuizDao;
import com.dto.Quiz;
import com.dto.Class;

@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		//Gets the details entered by the teacher in the quiz form
		String quizName = request.getParameter("quizName");
		int questions = Integer.parseInt(request.getParameter("questions"));
		int options = Integer.parseInt(request.getParameter("options"));
		String date = request.getParameter("date");
		Class classroom = (Class)session.getAttribute("classroom");
		int classId = classroom.getClassId();
		//gets the current date and current time
		String currentDate = (java.time.LocalDate.now()).toString();
		String currentTime = (java.time.LocalTime.now()).toString();
	    String createdTime = currentDate+currentTime;
		Quiz quiz = new Quiz(quizName,date,questions,options,classId,createdTime); 
		QuizDao quizdao = new QuizDao();
		//adds quiz object into the quiz table
		int x = quizdao.register(quiz);
		
		if(x > 0){
			session.setAttribute("quiz",quiz);
			List<Quiz> quiz1 = QuizDao.getQuiz(classId);
			int n = quiz1.size();
			int quizId = quiz1.get(n-1).getQuizId();
			System.out.println(quizId);
			//redirects to Questions page
		RequestDispatcher rd = request.getRequestDispatcher("Question.jsp");
		rd.include(request, response);
	    }
		else{
			RequestDispatcher rd = request.getRequestDispatcher("Question.jsp");
			rd.include(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

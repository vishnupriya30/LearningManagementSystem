/*This servlet is responsible to add get the marks of all students who attempted quiz
 * 
 */
package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.QuizDao;
import com.dao.CorrectionDao;
import com.dto.Quiz;
import com.dto.Correction;
import com.dto.Class;
import com.dto.User;
import com.dao.UserDao;
import com.dao.QuestionsDao;
import com.dto.Questions;


@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		int quizId = Integer.parseInt(request.getParameter("quizId"));
		Class classroom = (Class)session.getAttribute("classroom");
		int classId = classroom.getClassId();
		List<Correction> correction = CorrectionDao.getSubmittedQuizWithClassIdAndQuizId(classId, quizId);
		String studentNames = "";
		String studentMarks = "";
		int n = correction.size();
		List<Questions> questions = QuestionsDao.getQuestionsByQuizId(quizId);
		int m = questions.size();
		int totalMarks = m*10;
		Integer[] count = new Integer[m+1];
		for(int i = 0;i <= m; i++){
			count[i] = 0;
		}
		for(int i = 0;i < n; i++){
			int userId = correction.get(i).getUserId();
			User user = UserDao.getUser(userId);
			String name = user.getFirstName();
			int marks = correction.get(i).getMarks();
			if(studentNames.length() == 0)
				studentNames = studentNames+name;
			else
				studentNames = studentNames+","+name;
			if(studentMarks.length() == 0)
				studentMarks = studentMarks+marks;
			else
				studentMarks = studentMarks+","+marks;
			if(marks == 0)
				count[0]++;
			else
			    count[(marks/10)]++;
		}
		String range = "";
		String labels = "";
		for(int i = 0;i <= m; i++){
			if(labels.length() == 0)
				labels += (i*10);
			else
				labels = labels+","+(i*10);
			if(range.length() == 0)
				range += (count[i]);
			else
				range = range+","+(count[i]);
		}
		session.setAttribute("studentNames", studentNames);
		session.setAttribute("studentMarks", studentMarks);
		session.setAttribute("range", range);
		session.setAttribute("labels", labels);
		session.setAttribute("quizId", quizId);
		RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

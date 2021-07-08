/*This servlet is responsible to get the
 * response of the student and to calculate marks.
 * A new entry is added into the correction table
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

import com.dto.Class;
import com.dto.User;
import com.dto.Quiz;
import com.dao.QuizDao;
import com.dao.UserDao;
import com.dto.Questions;
import com.dao.QuestionsDao;
import com.dto.Correction;
import com.dao.CorrectionDao;

@WebServlet("/CorrectionServlet")
public class CorrectionServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		int quizId = Integer.parseInt(request.getParameter("quizId"));
		Quiz quiz = QuizDao.getQuizByQuizId(quizId);
		int noq = quiz.getQuestions();
		List<Questions> questions = QuestionsDao.getQuestionsByQuizId(quizId);
		int marks = 0;
		String attemptedAnswers = "";
		for(int i = 0;i < noq; i++){
			String answer = questions.get(i).getAnswer();
			String ansname = "answer"+i;
			String attempt = request.getParameter(ansname);
			System.out.println("attempt:"+attempt);
			System.out.println("answer:"+answer);
			//All the options selected by the student are converted into a string
			if(attemptedAnswers.length() == 0)
				attemptedAnswers = attemptedAnswers+attempt;
			else
				attemptedAnswers = attemptedAnswers+"#"+attempt;
			//Each correct answer carries 10 marks
			if(answer.equals(attempt))
				marks += 10;
		}
		session.setAttribute("quizScore",marks);
		session.setAttribute("attemptedQuiz",quiz);
		Class classroom = (Class)session.getAttribute("classroom");
		User user = (User)session.getAttribute("user");
		int userId = user.getUserId();
		String registerNo = user.getRegisterNo();
		int classId = classroom.getClassId();
		try{
		Correction correction = new Correction(attemptedAnswers,marks,quizId,classId,userId,registerNo);
		CorrectionDao correctiondao = new CorrectionDao();
		//adds a new entry in correction table to store the student's response
		int x = correctiondao.register(correction);
		if(x > 0){
		//Upon successful submission it sends mail to the student
		RequestDispatcher rd = request.getRequestDispatcher("MarksEmail.jsp");
		rd.include(request, response);
	    }
		}
		catch(Exception e){
			System.out.println("Error Occured:"+e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

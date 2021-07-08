/*This servlet is responsible to add a new entry into the question
 * by getting details form Question form
 */
package com.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dao.QuestionsDao;
import com.dao.QuizDao;
import com.dto.Questions;
import com.dto.Quiz;

@WebServlet("/QuestionServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 20)
public class QuestionServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
        Quiz quiz = (Quiz)session.getAttribute("quiz");
        List<Quiz> quiz1 = QuizDao.getQuiz(quiz.getClassId());
        int n = quiz1.size();
        int quizId = quiz1.get(n-1).getQuizId();
        System.out.println(quizId);
        int noq = quiz.getQuestions();
        int options = quiz.getMaxOptions();
        String allOptions = "";
        int x = 0;
        for(int i = 0;i < noq; i++){
        	String qname = "question"+i;
        	String q = (String) request.getParameter(qname);
        	String ansname = "answer"+i;
        	String a = (String) request.getParameter(ansname);
        	String imageName = "image"+i;
        	Part part = request.getPart(imageName);
    		String fileName = extractFileName(part);
    		String saveDir = "uploaded_files";
    		  imageUpload(request, fileName, saveDir,part);
        	for(int j = 0;j < options; j++){
        		String opname = "option"+i+""+j;
        		String o = (String)request.getParameter(opname);
        		if(allOptions.length() == 0)
        			allOptions = allOptions+o;
        		else
        		    allOptions = allOptions+"#"+o;
        	} 
          
        	Questions questions = new Questions(q,allOptions,a,quizId,fileName); 
    		QuestionsDao questionsDao = new QuestionsDao();
    		//question object is added into the question table
    		x = questionsDao.register(questions);
    		allOptions = "";
    		System.out.println("Registered"+i);
        }
        if(x > 0){
        	RequestDispatcher rd = request.getRequestDispatcher("TeacherQuiz.jsp");
    		rd.include(request, response);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	//Uploads a image
	private void imageUpload(HttpServletRequest request, String fname,String saveDir,Part part) throws ServletException, IOException {
		//path of Uploaded_files directory
		 String savePath = "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps\\"+saveDir;	 
		 File fileSaveDir = new File(savePath);	 
		        if (!fileSaveDir.exists()) {
		            fileSaveDir.mkdir();
		        }
		 String fileName = extractFileName(part);
		 System.out.println(fileName);
	     fileName = new File(fileName).getName();
		 System.out.println(fileName);
		 part.write(savePath + "/" + fname);
		 System.out.print("File Uploaded Successfully ");		
		}
	
	//Filename extraction
	 private String extractFileName(Part part) {
	        String contentDisp = part.getHeader("content-disposition");
	        String[] items = contentDisp.split(";");
	        for (String s : items) {
	            if (s.trim().startsWith("filename")) {
	                return s.substring(s.indexOf("=") + 2, s.length()-1);
	            }
	        }
	        return "";

   }


}

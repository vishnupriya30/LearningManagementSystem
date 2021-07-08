/* This servlet is responsible to submit a document in the assignment section
 * 
 */
package com.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.SubmissionsDao;
import com.dto.Submissions;
import com.dto.Class;
import com.dto.User;


@WebServlet("/SubmissionServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 20)
public class SubmissionServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
        Class classroom = (Class) session.getAttribute("classroom");
        int classId = classroom.getClassId();
        User user = (User)session.getAttribute("user");
        int userId = user.getUserId();
        String registerNo = user.getRegisterNo();
        int assignmentId = Integer.parseInt(request.getParameter("assignmentId"));
        String submittedTime = (java.time.LocalDate.now()).toString();
        Part part = request.getPart("fileUpload");
		String fileName = extractFileName(part);
		String saveDir = "uploaded_files";
		imageUpload(request, fileName,saveDir);
        
        Submissions submission = new Submissions(fileName,submittedTime,userId,classId,assignmentId,registerNo); 
		SubmissionsDao submissionDao = new SubmissionsDao();
		//adds a new entry in the submissions table
		int x = submissionDao.register(submission);
		if(x > 0){
		//redirects to StudentAssignment page
		RequestDispatcher rd = request.getRequestDispatcher("StudentAssignments.jsp");
		rd.include(request, response);
	    }
		else{
			RequestDispatcher rd = request.getRequestDispatcher("StudentAssignments.jsp");
			rd.include(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	private void imageUpload(HttpServletRequest request, String fname,String saveDir) throws ServletException, IOException {
		
		 String savePath = "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps\\"+saveDir;	 
		 File fileSaveDir = new File(savePath);	 
		        if (!fileSaveDir.exists()) {
		            fileSaveDir.mkdir();
		        }
		 Part part = request.getPart("fileUpload");
		 String fileName = extractFileName(part);
		 System.out.println(fileName);
	     fileName = new File(fileName).getName();
		 System.out.println(fileName);
		 part.write(savePath + "/" + fname);
		 System.out.print("File Uploaded Successfully ");		
		}
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

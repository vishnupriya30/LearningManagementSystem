/* This servlet is responsible to upload a assignment file in the class
 * 
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

import com.dao.AssignmentsDao;
import com.dto.Class;
import com.dto.Assignments;
import com.dto.User;

@WebServlet("/UploadAssignmentServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 20)
public class UploadAssignmentServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
        Class classroom = (Class) session.getAttribute("classroom");
        int classId = classroom.getClassId();
        User user = (User)session.getAttribute("user");
        int userId = user.getUserId();
        String created = (java.time.LocalDate.now()).toString();
        String scheduled = request.getParameter("scheduled");
        Part part = request.getPart("fileUpload");
		String fileName = extractFileName(part);
		String saveDir = "uploaded_files";
		imageUpload(request, fileName,saveDir);
        
        Assignments assignment = new Assignments(fileName,fileName,created,scheduled,classId,userId); 
        session.setAttribute("assignments",assignment);
		AssignmentsDao assignmentsdao = new AssignmentsDao();
		//adds a new entry in the assignment table
		int x = assignmentsdao.register(assignment);
		if(x > 0){
		//redirects to TeacherAssignment page
		RequestDispatcher rd = request.getRequestDispatcher("TeacherAssignments.jsp");
		rd.include(request, response);
	    }
		else{
			RequestDispatcher rd = request.getRequestDispatcher("TeacherAssignments.jsp");
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

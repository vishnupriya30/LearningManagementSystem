/* This servlet is responsible to upload a document in the class
 * 
 */
package com.web;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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

import com.dao.NotesDao;
import com.dao.UserDao;
import com.dto.Notes;
import com.dto.User;
import com.dto.Class;

@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
        Class classroom = (Class) session.getAttribute("classroom");
        int classId = classroom.getClassId();
        User user = (User)session.getAttribute("user");
        int userId = user.getUserId();
        String date = (java.time.LocalDate.now()).toString();
        boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
		 if (!isMultipartContent) {
		 return;
		 }
		 String fileName="";
		 FileItemFactory factory = new DiskFileItemFactory();
		 ServletFileUpload upload = new ServletFileUpload(factory);
		 try {
		 List < FileItem > fields = upload.parseRequest(request);
		 Iterator < FileItem > it = fields.iterator();
		 if (!it.hasNext()) {
		 return;
		 }
		 while (it.hasNext()) {
		 FileItem fileItem = it.next();
		 boolean isFormField = fileItem.isFormField();
		 fileName = fileItem.getName();
		 System.out.print("FIlename"+fileName);
		 if (fileItem.getSize() > 0) {
		 fileItem.write(new File("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps\\uploaded_files\\" + fileItem.getName()));
		 }
		 }
		 } catch (Exception e) {
		 e.printStackTrace();
		 } 
       
        Notes notes = new Notes(fileName,fileName,date,classId,userId); 
        session.setAttribute("notes",notes);
		NotesDao notesdao = new NotesDao();
		//adds a new entry in the notes table
		int x = notesdao.register(notes);
		if(x > 0){
		//redirects to Notes page
		RequestDispatcher rd = request.getRequestDispatcher("Notes.jsp");
		rd.include(request, response);
	    }
		else{
			RequestDispatcher rd = request.getRequestDispatcher("Notes.jsp");
			rd.include(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

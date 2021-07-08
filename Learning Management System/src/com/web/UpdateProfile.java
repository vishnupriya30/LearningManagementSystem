/*This servlet is responsible to update profile photo of the user
 * 
 */
package com.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.http.Part;

import com.dao.UserDao;
import com.dto.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;

@WebServlet("/UpdateProfile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 20)
public class UpdateProfile extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int id =Integer.parseInt(request.getParameter("userId"));
		Part part = request.getPart("image");
		String fileName = extractFileName(part);
		User user;
		String saveDir = "uploaded_files";
		UserDao userdao = new UserDao();
		user = userdao.getUser(id);
		user.setProfilePath(fileName);
		imageUpload(request, fileName,saveDir);
		int x = userdao.editProfilePath(user);
     	out.print("<html>");
	    RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
		rd.include(request, response);
		out.println("</html>");
		
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
		 Part part = request.getPart("image");
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

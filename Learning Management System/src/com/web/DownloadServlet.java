/*This servlet is responsible to download the document
 * upon clicking the document
 */
package com.web;

import java.io.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.Notes;

@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {
	int buffer_size = 1024*100;
	//Name of the directory which contains the uploaded documents
	String saveDir = "uploaded_files";
	String fileName = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		fileName = request.getParameter("fileName");
		//Path of the uploaded_files directory
		String applicationPath = "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps\\";
		String downloadPath = applicationPath+ File.separator+saveDir;
		String filePath = downloadPath + File.separator+ fileName;
		System.out.println("ApplicationPath:"+applicationPath);
		System.out.println("DownloadPath:"+downloadPath);
		System.out.println("FilePath:"+filePath);
		File file = new File(filePath);
		OutputStream outstream = null;
		FileInputStream inputStream = null;
		if(file.exists()){
			String mimetype = "application/octet-stream";
			response.setContentType(mimetype);
			String headerKey = "Content-Disposition";
			String headerValue = String.format("attachment; filename=\"%s\"", file.getName());
			response.setHeader(headerKey, headerValue);
			try{
				outstream = response.getOutputStream();
				inputStream = new FileInputStream(file);
				byte[] buffer = new byte[buffer_size];
				int bytesRead = -1;
				while((bytesRead = inputStream.read(buffer)) != -1){
					outstream.write(buffer,0,bytesRead);
				}
			}
			catch(Exception e){
				System.out.println(e);
			}
		}
		else{
			response.setContentType("text/html");
			response.getWriter().println("<html><body><h4>Not Exists</h4></body></html>");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

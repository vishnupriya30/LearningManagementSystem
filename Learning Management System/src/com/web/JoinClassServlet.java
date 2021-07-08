/*This servlet is responsible to add a new entry into the section table.
 *
 */
package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.dto.User;
import com.dao.ClassDao;
import com.dao.SectionDao;
import com.dto.Class;
import com.dto.Section;


@WebServlet("/JoinClassServlet")
public class JoinClassServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		//gets the class code entered by the student in the join class form
		String classCode = request.getParameter("classCode");
		System.out.println("Entered Classcode:"+classCode);
		User user= new User();
		String username = (String) session.getAttribute("username");
		try{
	    user = UserDao.getUser(username);
		session.setAttribute("user", user);
		if(classCode !=null){
			Class classroom = new Class();
			classroom = ClassDao.getClass(classCode);
			int classId = classroom.getClassId();
			int facultyId = classroom.getUserId();
			int userId = user.getUserId();
			//gets the list of classes in which user joined
			List<Section> sections = SectionDao.getAllSections(userId);
			ArrayList<String> classes = new ArrayList<>();
			for(Section s: sections){
				Class c = ClassDao.getClass(s.getClassId());
				System.out.println("ClassCode:"+c.getClassCode());
				classes.add(c.getClassCode());
			}
			System.out.println("UserId:"+userId+"FacultyId:"+facultyId);
			//checks if the user is not the teacher and the member has not joined the class already
			if(userId != facultyId && !classes.contains(classCode)){
			Section section = new Section(userId,classId);
			SectionDao sectionDao = new SectionDao();
			//adds a new entry in section table indicating the user joined the class
			int x = sectionDao.register(section);
			session.setAttribute("classCode", classCode);
			session.setAttribute("classId", classId);
			if(x > 0){
				//redirects user to HomePage
				System.out.println("Joined class with userId:"+userId+" classId:"+classId);
				RequestDispatcher rd = request.getRequestDispatcher("JoinClass.jsp");
				rd.include(request, response);
		    }
			else{
				System.out.println("You are not joined in class");
			}
			}
			else{
				System.out.println("Else Block");
				RequestDispatcher rd = request.getRequestDispatcher("JoinClass.jsp");
				rd.include(request, response);
			}
		}
		else
			{
			    //If class code is null it prompts to enter the correct class code
				RequestDispatcher rd = request.getRequestDispatcher("JoinClass.jsp");
				out.println("Sorry please enter the correct code");
				rd.forward(request, response);
			}
		}catch(Exception e){
			RequestDispatcher rd = request.getRequestDispatcher("JoinClass.jsp");
			rd.include(request, response);	
		}
			
		out.println("</html>");		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dto.Section" import="com.dao.SectionDao" import="com.dto.User" import="com.dao.UserDao" import="com.dto.Post" import="com.dao.PostDao" import="com.dto.Class" import="com.dao.AssignmentsDao" import="com.dto.Assignments" import="java.util.*" import="java.io.*"
    import="com.dao.SubmissionsDao" import="com.dto.Submissions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Alegreya:wght@600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.column {
  float: left;
  width: 33.33%;
  padding: 10px;
  height: 300px; /* Should be removed. Only for demonstration */
}

#quiz {
  font-family: 'Alegreya', serif; 
  font-size:20px;
  border-collapse: collapse;
  width: 100%;
}

#quiz td, #quiz th {
  border: 1px solid #ddd;
  padding: 8px;
}

#quiz tr:nth-child(even){background-color: #f2f2f2;}

#quiz tr:hover {background-color: #ddd;}

#quiz th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color:#3a7bd5;
  color: white;
}
</style>
</head>
<body>
<div style="background-image: url('pics/bg3.png');height:790px;width:100%">
<%Class classroom = (Class)session.getAttribute("classroom");
List<Section> users = SectionDao.getUsers(classroom.getClassId());
%>
<div style="background:linear-gradient(to bottom, #00d2ff, #3a7bd5 );width:100%;height:150px;margin-top:-20px">
<a href="HomePage.jsp" style="text-decoration:none"><h1 style="padding-top:50px;padding-left:20px;color:white;text-shadow:2px 2px #3a7bd5;font-size:50px"><%=classroom.getSubjectName()%></h1></a>
<div style="margin-left:1200px;margin-top:-125px">
<table>
<tr><h3 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5">Faculty Name : <%=classroom.getFacultyName()%></h3></tr>
<tr><h3 style="font-family: 'Alegreya', serif; color:white;text-shadow:2px 2px #3a7bd5">Subject Code : <%=classroom.getClassCode() %></h3></tr>
<tr><h3 style="font-family: 'Alegreya', serif; color:white;text-shadow:2px 2px #3a7bd5">No of Students : <%=users.size()%></h3></tr>
</table>
</div>
</div>
<div class="row" style="padding-top:10px">
  <div class="column" style="background:linear-gradient(to bottom, #00d2ff, #3a7bd5);width:200px;height:600px;">
  <a href="Classroom.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Stream</h2></a><br>
  <a href="Classwork.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Classwork</h2></a><br>
  <a href="People.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">People</h2></a><br>
  <a href="Messages.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Messages</h2></a><br>
  </div>
</div>
  <%
  int assignmentId = Integer.parseInt(request.getParameter("assignmentId"));
  int classId = classroom.getClassId();
  List<Submissions> submissions = SubmissionsDao.getSubmissionsById(assignmentId, classId);
  Collections.sort(submissions);
  %>
<div style="width:50%;background-color:#3a7bd5;height:55px;border-style:solid;border-radius:3px;border-color:white;margin-left:230px;margin-top:10px">
  <center style="margin-top:10px;font-size:30px;color:white;font-family: 'Alegreya', serif; color:white;text-shadow:2px 2px #3a7bd5;">SUBMITTED</center>
  <table id="quiz" style="margin-top:20px">
  <tr>
  <th>S.No</th>
  <th>Register No</th>
  <th>Student Name</th>
  <th>Assignment</th>
  </tr>
  <%
  List<Integer> submittedUserId = new ArrayList<Integer>();
  for(int i = 0;i < submissions.size(); i++){
	  submittedUserId.add(submissions.get(i).getUserId());
  String registerNo = submissions.get(i).getRegisterNo();
  User usern = UserDao.getUserByRegisterNo(registerNo);
  %>
  <tr>
  <td><%=i+1%></td>
  <td><%=registerNo%></td>
  <td><%=usern.getFirstName()+" "+usern.getLastName()%></td>
  <td><a href="DownloadServlet?fileName=<%=submissions.get(i).getSubmissionName()%>" style="text-decoration:none;"><%=submissions.get(i).getSubmissionName()%></a></td>
  </tr>
  <%} %>
  </table>
  </div>
  <% List<Section> section = SectionDao.getUsers(classId);
  List<Integer> allUsers = new ArrayList<Integer>();
  for(int i = 0;i < section.size(); i++){
	  allUsers.add((section.get(i)).getUserId());
  }
  List<User> notSubmittedUsers = new ArrayList<User>();
  for(int i = 0;i < allUsers.size(); i++){
	  if(!submittedUserId.contains(allUsers.get(i)))
		  notSubmittedUsers.add(UserDao.getUser(allUsers.get(i)));
  }
  Collections.sort(notSubmittedUsers);
  %>
  <div style="width:30%;background-color:#3a7bd5;height:55px;border-style:solid;border-radius:3px;border-color:white;margin-left:1030px;margin-top:-60px">
  <center style="margin-top:10px;font-size:30px;color:white;font-family: 'Alegreya', serif; color:white;text-shadow:2px 2px #3a7bd5;">NOT SUBMITTED</center>
  <table id="quiz" style="margin-top:20px">
  <tr>
  <th>S.No</th>
  <th>Register No</th>
  <th>Student Name</th>
  </tr>
  <%for(int i = 0;i < notSubmittedUsers.size(); i++){ %>
  <tr>
  <td><%=i+1%></td>
  <td><%=notSubmittedUsers.get(i).getRegisterNo()%></td>
  <td><%=notSubmittedUsers.get(i).getFirstName()+" "+notSubmittedUsers.get(i).getLastName()%></td>
  </tr>
  <%} %>
  </table>
</div>
</div>
</body>
</html>
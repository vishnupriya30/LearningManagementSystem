<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="com.dto.Quiz" import="com.dao.QuizDao" import="com.dto.Class"
     import="com.dto.Section" import="com.dao.SectionDao" import="com.dto.User" import="com.dto.Correction" import="com.dao.CorrectionDao"
      import="com.dto.Questions" import="com.dao.QuestionsDao"   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Alegreya:wght@600&display=swap" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#quiz {
  font-family: 'Alegreya', serif; 
  font-size:20px;
  border-collapse: collapse;
  width: 70%;
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
  <%Class classroom = (Class)session.getAttribute("classroom");
List<Section> users = SectionDao.getUsers(classroom.getClassId());
User user = (User)session.getAttribute("user");
int userId = user.getUserId();
%>
<div style="background-image: url('pics/bg3.png');height:790px;width:100%">
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

<div class="row" style="margin-top:-20px">
  <div class="column" style="background:linear-gradient(to bottom, #00d2ff, #3a7bd5);width:200px;height:600px;">
  <a href="Classroom.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5;padding-left:10px;padding-top:40px">Stream</h2></a><br>
  <a href="Classwork.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Classwork</h2></a><br>
  <a href="People.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5;padding-left:10px">People</h2></a><br>
  <a href="Messages.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5;padding-left:10px">Messages</h2></a><br>
  </div>
</div>
</div>
<div>
<div style="width:70%;background-color:#3a7bd5;height:60px;border-style:solid;border-radius:3px;border-color:white;margin-top:-620px;margin-left:220px">
  <center style="margin-top:10px;font-size:30px;color:white;font-family: 'Alegreya', serif; color:white;text-shadow:2px 2px #3a7bd5;"> DASHBOARD </center>
   <% 
      int classId = classroom.getClassId();
      List<Quiz> quiz = QuizDao.getQuiz(classId);
      int n = quiz.size();
     %>
</div>
<div style="margin-left:320px;margin-top:40px">
<table id="quiz">
<tr>
<th>QuizName</th>
<th>No of Students Attempted</th>
<th>No of Students Not Attempted</th>
</tr>
<%for(int i = 0 ; i < n ; i++){%>
<tr>
<td><a href="DashboardServlet?quizId=<%=quiz.get(i).getQuizId()%>" style="text-decoration:none;color:black"><%=quiz.get(i).getQuizName()%></a></td>
<%List<Correction> correction = CorrectionDao.getSubmittedQuizWithClassIdAndQuizId(classId,quiz.get(i).getQuizId());
int totalStudents = (int)session.getAttribute("totalStudents");
%>
<td><%=correction.size()%></td>
<td><a href="NotAttempted.jsp?quizId=<%=quiz.get(i).getQuizId()%>" style="text-decoration:none;color:black"><%=totalStudents-correction.size()%></a></td>
</tr>
<%} %>
</table>
</div>
</div>
</body>
</html>
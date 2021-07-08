<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dto.Correction" import="com.dao.CorrectionDao" import="com.dto.Section" import="com.dao.SectionDao" import="com.dto.User" import="com.dao.UserDao" import="com.dto.Post" import="com.dao.PostDao" import="com.dto.Class" import="com.dao.QuizDao" import="com.dto.Quiz" import="java.util.*" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Alegreya:wght@600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<%Class classroom = (Class)session.getAttribute("classroom");
List<Section> users = SectionDao.getUsers(classroom.getClassId());
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
<div style="margin-top:-640px;margin-left:300px">
<table>
<tr>
<td style="width:400px"><a href="AssignedQuiz.jsp" style="text-decoration:none"><h2 style="color:#3a7bd5;font-family: 'Alegreya', serif;font-size:30px">Assigned</h2></a></td>
<td style="width:420px"><a href="SubmittedQuiz.jsp" style="text-decoration:none"><h2 style="color:#3a7bd5;font-family: 'Alegreya', serif;font-size:30px">Submitted</h2></a></td>
<td><a href="MissedQuiz.jsp" style="text-decoration:none"><h2 style="color:#3a7bd5;font-family: 'Alegreya', serif;font-size:30px">Missed</h2></a></td>
</tr>
</table>
</div>
    <%
    try{
    String currentDate = (java.time.LocalDate.now()).toString();
    String currentTime = (java.time.LocalTime.now()).toString();
    String currentDateTime = currentDate+currentTime.substring(0,5);
    int userId = ((User)session.getAttribute("user")).getUserId();
	int classId = classroom.getClassId();
	List<Quiz> quiz = QuizDao.getQuiz(classId);
	List<Correction> submitted = CorrectionDao.getSubmittedQuiz(userId,classId);
	List<Integer> submittedQuizId = new ArrayList<>();
	for(int i = 0;i < submitted.size();i++){
		submittedQuizId.add(submitted.get(i).getQuizId());
	}
	System.out.println("Quiz:"+quiz.size());
	if(quiz.size() == 0){
%>
<h4>No quiz</h4>
<%}else{
%>
<div style="margin-top:10px">
<table>
<%
	for(Quiz q : quiz){
		if(submittedQuizId.contains(q.getQuizId())){
%>
<tr>
<td>
<div style="background-color:white;box-shadow: 3px 3px lightgrey; width:600px;height:80px;margin-top:10px;margin-left:220px;border-radius:10px;border:1px solid grey">
 <p style="margin-top:4px; margin-left:8px; font-family: 'Alegreya', serif;">Scheduled on: <%=q.getCreatedTime().substring(0,10)%></p>
 <p style="margin-top:-35px; margin-left:340px; font-family: 'Alegreya', serif;">Submit On or Before : <%=q.getScheduled().substring(0,10)%></p>
 <%String scheduledTime = q.getScheduled().substring(0,10)+q.getScheduled().substring(11,16);
 if(scheduledTime.compareTo(currentDateTime) < 0){
%>
 <a href="SubmittedAnswersAfterCorrection.jsp?quizId=<%=q.getQuizId()%>" style="text-decoration:none"><h2 style="margin-top:10px; margin-left:8px;color:#3a7bd5;font-family: 'Alegreya', serif;"><%=q.getQuizName()%></h2></a>
 <%}else{%>
 <a href="SubmittedQuizBeforeDeadline.jsp?quizId=<%=q.getQuizId()%>" style="text-decoration:none"><h2 style="margin-top:10px; margin-left:8px;color:#3a7bd5;font-family: 'Alegreya', serif;"><%=q.getQuizName()%></h2></a>
</div>
</td>
</tr>
<%}}}}
}
catch(Exception e){
System.out.println(e);
}%>
</table>
</div>
</div>
</body>
</html>
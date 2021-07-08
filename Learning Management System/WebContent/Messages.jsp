<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dto.User" import="com.dao.UserDao" import="com.dto.Post" import="com.dao.PostDao" import="com.dto.Class" import="com.dao.SectionDao" import="com.dto.Section" import="java.util.*" import="java.io.*"%>
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
</style>
</head>
<body>
<%Class classroom = (Class)session.getAttribute("classroom");
List<Section> users = SectionDao.getUsers(classroom.getClassId());
session.setAttribute("totalStudents",users.size());
User user1 = (User)session.getAttribute("user");
int userId = user1.getUserId();
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
<div class="row" style="padding-top:10px">
  <div class="column" style="background:linear-gradient(to bottom, #00d2ff, #3a7bd5);width:200px;height:600px;">
  <a href="Classroom.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Stream</h2></a><br>
  <a href="Classwork.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Classwork</h2></a><br>
  <a href="People.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">People</h2></a><br>
  <a href="Messages.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Messages</h2></a><br>
  </div>
  <div class="column" style="width:1000px;height:500px">
  <div style="width:95%;background-color:#3a7bd5;height:60px;border-style:solid;border-radius:3px;border-color:white;margin-left:105px">
  <center style="margin-top:10px;font-size:30px;color:white;font-family: 'Alegreya', serif; color:white;text-shadow:2px 2px #3a7bd5;"><i class="fa fa-comments" aria-hidden="true"></i>&nbsp&nbspMESSAGES</center>
  </div>
  <%try{User touser = (User)session.getAttribute("user");
     List<Post> prposts = PostDao.getAllPostsToUser(touser.getUserId(),classroom.getClassId());
     if(prposts.size() == 0){
   %><img src="pics/nomessages.png" height=220px width=220px style="margin-top:20px;margin-left:500px;opacity:0.6"><%
     }else{
      for(Post p : prposts){%>
    <div style="background-color:white;box-shadow: 3px 3px lightgrey; width:920px;height:70px;margin-top:20px;margin-left:120px;border-radius:10px;border:1px solid grey">
    <%User user = UserDao.getUser(p.getFromUserId());%>
    <p style="margin-top:2px; margin-left:8px;font-family: 'Alegreya', serif;">From : <%=user.getFirstName()+" "+user.getLastName()%></p>
    <p style="margin-top:-40px; margin-left:800px;font-family: 'Alegreya', serif;">On : <%=p.getDate()%></p>
    <h3 style="margin-top:-10px;font-family: 'Alegreya', serif; margin-left:8px;color:#3a7bd5"><%=p.getMessage()%></h3>
    </div>
    <%}}}catch(Exception e){
    System.out.println(e);
    }%>
</div>
</body>
</html>


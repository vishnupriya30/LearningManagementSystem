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
input[type=button], input[type=submit], input[type=reset]  {
  background-color: #3a7bd5;
  border: none;
  color: white;
  padding: 15px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 15px;
  border-radius: 5px 5px 5px 5px;
  margin: 0px 5px 5px 2px;
  font-family: 'Alegreya', serif;
}
input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: #00d2ff;
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

    <div style="width:60%;background-color:#3a7bd5;height:55px;border-style:solid;border-radius:3px;border-color:white;margin-left:250px;margin-top:10px">
  <center style="margin-top:10px;font-size:30px;color:white;font-family: 'Alegreya', serif; color:white;text-shadow:2px 2px #3a7bd5;"><i class="fa fa-bullhorn" aria-hidden="true"></i>&nbsp&nbspANNOUNCEMENTS</center>
  </div>
    <form action="Announcement.jsp" Method="post">
    <input type="submit" value="New Announcement" style="margin-left:1000px;margin-top:-55px">
    </form>
    </div>
    <%try{List<Post> posts = PostDao.getAllPostsToClass(classroom.getClassId());
    if(posts.size() == 0){
    	%>
    	<img src="pics/noposts.png" height=250px width=250px style="margin-left:500px;margin-top:20px;opacity:0.4">
    	<%
    }else{
      for(Post p : posts){%>
    <div style="background-color:white;box-shadow: 3px 3px lightgrey; width:900px;height:75px;margin-top:20px;margin-left:250px;border-radius:10px;border:1px solid grey">
    <%User user = UserDao.getUser(p.getFromUserId());%>
    <p style="margin-top:2px; margin-left:8px; font-family: 'Alegreya', serif;">From : <%=user.getFirstName()+" "+user.getLastName()%></p>
     <p style="margin-top:-39px; margin-left:780px; font-family: 'Alegreya', serif;">On : <%=p.getDate()%></p>
    <h3 style="margin-top:-10px; margin-left:8px;color:#3a7bd5;font-family: 'Alegreya', serif;"><%=p.getMessage()%></h3>
    </div>
    <%}}}
    catch(Exception e){
    	System.out.println(e);
    }%>
  </div>
</body>
</html>


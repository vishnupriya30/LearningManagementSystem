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
  width:100%;
  padding: 10px;
  height: 300px;
}
#quiz {
  font-family: 'Alegreya', serif; 
  font-size:20px;
  width: 50%;
  border-collapse: collapse;
  margin-left:650px;
  margin-top:10px
}

#quiz td {
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
 <table style="padding-top:20px;">
 <tr>
 <th style="width:500px"><i class="fa fa-user fa-5x" aria-hidden="true" style="color: #3a7bd5"></i><br/><h1 style="color:#3a7bd5;font-family: 'Alegreya', serif;margin-top:-8px">Faculty</h1></th>
 </tr>
 <tr >
 <td style="padding-left:180px;font-size:30px;font-family: 'Alegreya', serif;color:black"><%=classroom.getFacultyName()%></td>
 </tr>
 </table>
 <table  id="quiz">
 <i class="fa fa-users fa-5x" aria-hidden="true" style="color: #3a7bd5;margin-left:850px;margin-top:-170px"></i><br/><h1 style="color:#3a7bd5;font-family: 'Alegreya', serif;margin-top:-90px;margin-left:830px">Students</h1>
 <%if(users.size() == 0){%>
 <tr><td style="padding-left:55px;padding-bottom:10px;font-size:25px;font-family: 'Alegreya', serif;color:red">No Students joined</td></tr>
 <%}else{%>
 <tr>
 <th>Student Name</th>
 <th>Register No</th>
 </tr>
 <%
 	 List<User> people = new ArrayList<User>();
	 for(Section s:users){
     User user = UserDao.getUser(s.getUserId());
     people.add(user);
	 }
	 Collections.sort(people);
	 for(int i = 0;i < people.size(); i++){
     %>
 <tr>
 <td style="padding-left:2px;padding-bottom:10px;font-size:18px;font-family: 'Alegreya', serif;color:black"><%=people.get(i).getFirstName()+" "+people.get(i).getLastName()%></td>
 <td><%=people.get(i).getRegisterNo()%></td>
 </tr>
 <%} 
}%>
</table>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dto.Class" import="com.dao.SectionDao" import="com.dto.Section" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Alegreya:wght@600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  input[type=button], input[type=submit], input[type=reset]  {
  background-color: white;
  border: none;
  color: #3a7bd5;
  padding: 10px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 20px;
  font-family: 'Alegreya', serif;
  border-radius: 5px 5px 5px 5px;
  margin: 0px 10px 5px 2px;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: white;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}
  </style>
</head>
<body>
<%Class classroom = (Class)session.getAttribute("classroom");
List<Section> users = SectionDao.getUsers(classroom.getClassId());
%>
<div style="background-image: url('pics/bg3.png');height:790px;width:100%">
<div style="background:linear-gradient(to bottom, #00d2ff, #3a7bd5 );width:100%;height:150px;margin-top:-20px">
<a href="HomePage.jsp" style="text-decoration:none"><h1 style="padding-top:50px;padding-left:20px;color:white;font-family: 'Alegreya', serif;text-shadow:2px 2px #3a7bd5;font-size:50px"><%=classroom.getSubjectName()%></h1></a>
<div style="margin-left:1200px;margin-top:-125px">
<table>
<tr><h3 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5">Faculty Name : <%=classroom.getFacultyName()%></h3></tr>
<tr><h3 style="font-family: 'Alegreya', serif; color:white;text-shadow:2px 2px #3a7bd5">Subject Code : <%=classroom.getClassCode() %></h3></tr>
<tr><h3 style="font-family: 'Alegreya', serif; color:white;text-shadow:2px 2px #3a7bd5">No of Students : <%=users.size()%></h3></tr>
</table>
</div>
</div>
<div class="row" style="margin-top:-10px;padding-left:20px">
  <div class="column" style="background:linear-gradient(to bottom, #00d2ff, #3a7bd5);width:200px;height:600px;">
  <a href="Classroom.jsp" style="text-decoration:none"><h2 style="color:white;padding-left:10px;padding-top:40px;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Stream</h2></a><br>
  <a href="Classwork.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Classwork</h2></a><br>
  <a href="People.jsp" style="text-decoration:none"><h2 style="color:white;padding-left:10px;padding-top:20px;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">People</h2></a><br>
  <a href="Messages.jsp" style="text-decoration:none"><h2 style="color:white;padding-top:20px;padding-left:10px;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Messages</h2></a><br>
  </div>
  <div class="container-fluid" style="padding-top:150px;padding-left:0px">
  <div class="row">
    <div class="col-sm-3">
    </div>
    <div class="col-sm-9" style="border:5px solid;border-color:white;box-shadow: 4px 4px 6px 6px lightgrey;background:linear-gradient(to bottom, #00d2ff, #3a7bd5);margin-top:-700px;width:800px;height:450px;">
       <h1 style="color:white;font-family: 'Alegreya', serif;"> Untitled Form </h1>
       <form action="QuizServlet" method="POST">
        <table>
        <tr>
        <td style="width:300px"><h3 style="color:white;font-family: 'Alegreya', serif;">Title</h4></td>
        <td><input type="text" name="quizName" required></td>
        </tr>
<tr>
<td style="width:300px"><h3 style="color:white;font-family: 'Alegreya', serif;">Number Of Questions</h4></td>
<td><input type="number" name="questions"  min="1" max="10" required></td>
<td rowspan="3" style="padding-bottom:15px;padding-left:10px"><img src="pics/quiz.png" style="padding-left:50px"></td>
</tr>
<tr>
<td><h3 style="color:white;font-family: 'Alegreya', serif;">Maximum No. Of Options</h4></td>
<td> <input type="number" name="options" style="width:70px"" min="2" max="5" required></td>
</tr>
<td><h3 style="color:white;font-family: 'Alegreya', serif;">Scheduled On</h3></td>
<td> <input type="datetime-local" name="date"></td>
</tr>
<tr>
<td style="padding-top:20px"><input type="submit" value="Create Quiz"></td>
</tr>
</table>
</form>
    </div>
  </div>
</div>

</body>
</html>


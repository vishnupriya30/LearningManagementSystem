<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dto.Class" import="com.dao.UserDao" import="com.dto.User" import="com.dao.SectionDao" import="com.dto.Section" import="java.util.*"%>
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
input[type=submit] {
    padding:5px 15px; 
    background:white; 
    border:0 none;
    cursor:pointer;
    -webkit-border-radius: 5px;
    border-radius: 5px; 
}
</style>
</head>
<body>
<%Class classroom = (Class)session.getAttribute("classroom");
List<Section> users = SectionDao.getUsers(classroom.getClassId());
User usern = (User)session.getAttribute("user");
int userIdn = usern.getUserId();
%>
<div style="background-image: url('pics/bg3.png');height:790px;width:100%">
<div style="background:linear-gradient(to bottom, #00d2ff, #3a7bd5 );width:100%;height:140px;margin-top:-40px">
<a href="HomePage.jsp" style="text-decoration:none"><h1 style="padding-top:40px;padding-left:20px;color:white;text-shadow:2px 2px #3a7bd5;font-size:50px"><%=classroom.getSubjectName()%></h1></a>
<div style="margin-left:1200px;margin-top:-125px">
<table>
<tr><h3 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5">Faculty Name : <%=classroom.getFacultyName()%></h3></tr>
<tr><h3 style="font-family: 'Alegreya', serif; color:white;text-shadow:2px 2px #3a7bd5">Subject Code : <%=classroom.getClassCode() %></h3></tr>
<tr><h3 style="font-family: 'Alegreya', serif; color:white;text-shadow:2px 2px #3a7bd5">No of Students : <%=users.size()%></h3></tr>
</table>
</div>
</div>
<div class="row" style="padding-top:10px">
  <div class="column" style="background:linear-gradient(to bottom, #00d2ff, #3a7bd5 );width:200px;height:600px;">
  <a href="Classroom.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Stream</h2></a><br>
  <a href="Classwork.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Classwork</h2></a><br>
  <a href="People.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">People</h2></a><br>
  <a href="Messages.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Messages</h2></a><br>
  </div>
  <div style="margin-top:20px;box-shadow: 5px 5px lightgrey;margin-left:350px;width:900px;height:250px;background:linear-gradient(to bottom, #00d2ff, #3a7bd5 );border-radius:10px;">
  <form action="PostServlet" Method="post">
  <select class="custom-select" name="to" style="margin-left:20px;margin-top:20px;height:30px;width:100px">
    <option>All Members</option>
    <%User faculty = UserDao.getUser(classroom.getUserId());
    User user2 = (User)session.getAttribute("user");
    if(faculty.getUserId() != user2.getUserId()){%>
    <option><%=faculty.getRegisterNo()+"-"+faculty.getFirstName()%></option>
    <%
    }
    for(Section u : users){
    	int userId = u.getUserId();
    	User user1 = (User)session.getAttribute("user");
    	if(userId != user1.getUserId()){
    		User user = UserDao.getUser(userId);
    %>
    <option><%=user.getRegisterNo()+"-"+user.getFirstName()%></option>
    <%}} %>
      </select><br/>
           <textarea name="message" rows="4" cols="50" style="width:800px;box-shadow: 2px 2px lightgrey; height:100px; padding-top:20px;margin-top:20px;margin-left:20px;" rows="4" cols="50"></textarea>
           <br/>
             <input type="submit" class="fa fa-paper-plane" value="&#9992; Send" style="margin-top:15px;margin-left:20px;height:30px">
           </form>
    </div>
  </div>
</div>
</body>
</html>


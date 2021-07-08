<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dto.Section" import="com.dao.SectionDao" import="com.dto.Submissions" import="com.dao.SubmissionsDao" import="com.dto.User" import="com.dao.UserDao" import="com.dto.Post" import="com.dao.PostDao" import="com.dto.Class" import="com.dao.AssignmentsDao" import="com.dto.Assignments" import="java.util.*" import="java.io.*"%>
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
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0,0.4);
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 30%;
  height:30%;
}
.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #3a7bd5;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

input[type=button], input[type=submit], input[type=reset]  {
  background-color: #3a7bd5;
  border: none;
  color: white;
  padding: 15px 60px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  border-radius: 5px 5px 5px 5px;
  margin: 0px 10px 5px 2px;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: #00d2ff;
}
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
<% User user = (User)session.getAttribute("user");
    List<Submissions> submissions = SubmissionsDao.getSubmissions(classroom.getClassId(),user.getUserId());
    List<Integer> assignmentId = new ArrayList<Integer>();
    for(int i = 0;i < submissions.size(); i++){
    	assignmentId.add(submissions.get(i).getAssignmentId());
    }
    String currentDate = (java.time.LocalDate.now()).toString();
  %>
<div style="width:60%;background-color:#3a7bd5;height:55px;border-style:solid;border-radius:3px;border-color:white;margin-left:250px;margin-top:10px">
  <center style="margin-top:10px;font-size:30px;color:white;font-family: 'Alegreya', serif; color:white;text-shadow:2px 2px #3a7bd5;">ASSIGNMENTS</center>
  </div>
  <div style="margin-left:260px;margin-top:20px">
  <table id="quiz">
  <tr>
  <th>S.No</th>
  <th>Assignment</th>
  <th>Posted On</th>
  <th>Scheduled Till</th>
  <th>Status</th>
  </tr>
  <%
  List<Assignments> assignments = AssignmentsDao.getAssignments(classroom.getClassId());
  int len = assignments.size();
  for(int i = 0;i < len; i++){
  %>
  <tr>
  <td><%=i+1%></td>
  <td><a href="DownloadServlet?fileName=<%=assignments.get(i).getAssignmentName()%>" style="text-decoration:none;color:black"><%=assignments.get(i).getAssignmentName()%></a></td>
  <td><%=assignments.get(i).getCreated()%></td>
  <td><%=assignments.get(i).getScheduled()%></td>
  <%if(assignmentId.contains(assignments.get(i).getAssignmentId())){%>
  <td>Submitted</td>
  <%}else if(!assignmentId.contains(assignments.get(i).getAssignmentId()) && currentDate.compareTo(assignments.get(i).getScheduled()) > 0){%>
  <td>Not Submitted</td>
  <%}else{%>
  <td><button style="background-color:white;border-radius:10px;border-color:#3a7bd5;height:30px;width:100px;font-size:15px;" id = "myBtn" type="submit">Submit</button>
  <div id="myModal" class="modal">
  <div class="modal-content">
  <span class="close">&times;</span>
  <div style="padding-top:35px">
  <form method="post" action="SubmissionServlet?assignmentId=<%=assignments.get(i).getAssignmentId()%>" enctype="multipart/form-data">
     <input type="file" name="fileUpload" size="50" style="margin-top:15px;margin-left:135px"/>
     <input type="submit" value="Submit" style="margin-top:35px;margin-left:135px">
  </form>
  </div>
  </div>
  </div></td>
  <%} %>
  </tr>
  <%} %>
  </table>
  </div>
</div>
<script>
var modal = document.getElementById("myModal");
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0];
btn.onclick = function() {
modal.style.display = "block";
}
span.onclick = function() {
modal.style.display = "none";
}
window.onclick = function(event) {
if (event.target == modal) {
modal.style.display = "none";
}
}
  </script>
</body>
</html>
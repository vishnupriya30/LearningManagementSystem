<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dto.Class" import="com.dto.Section" import="com.dto.User" import="com.dao.ClassDao" import="com.dao.SectionDao" import="com.dao.UserDao" import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Alegreya:wght@600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html {
  box-sizing: border-box;
}

.column {
  float: left;
  width: 20%;
  margin-bottom: 16px;
  padding-top:10px;
  padding-left:30px;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
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

.button:hover {
   background-color: orange;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  width:310px
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}


body {
  font-family: "Lato", sans-serif;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
  color:white;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

.modal1 {
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
.modal-content1 {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 30%;
  height:30%;
}


.close1 {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close1:hover,
.close1:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 30px;
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
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 0px 10px 5px 2px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: #00d2ff;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}
h2.round2 {
  border: 3px solid white;
  border-radius: 8px;
}
input[type=text] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 55%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder {
  color: #cccccc;
}

*:focus {
    outline: none;
}
</style>
</head>
<body>
<%
User user = new User();
    Section section = new Section();
    String username = (String)session.getAttribute("username");
    user = UserDao.getUser(username);
%>
<div style="width:100%;height:150px;background:linear-gradient(to bottom, #00d2ff, #3a7bd5);">
<table>
    <th>
    <a href="HomePage.jsp" style="text-decoration:none"><h1 style="padding-top:20px;padding-left:30px;font-family: 'Alegreya', serif; font-size:50px;color:white"> Vishnu Classroom </h1></a>
     </th>
   <th style="padding-left:900px;padding-top:25px;">
        <button style="background-color:white;border-color:#3a7bd5;border-radius:10px;height:50px;width:150px;font-size:20px" id = "myBtn1" type="submit">Join Class</button>
        <div id="myModal1" class="modal1">
  <div class="modal-content1">
    <span class="close1">&times;</span>
    <div style="padding-top:35px">
     <form action="JoinClassServlet" Method="post">
     <input type="text" id="classCode" name="classCode" placeholder="Class Code" required>
     <input type="submit" value="Join Class" style="margin-top:20px">
  </form>
  </div>
    </div>
     </th>
     <table>
    <%
    int userId = user.getUserId();
    List<Section> sections = (List<Section>)SectionDao.getAllSections(userId);
    int tclass = sections.size();
    if(tclass == 0){
%>
<img src="pics/noclasses.png" height = 300px width = 300px style="margin-left:620px;margin-top:100px;opacity:0.6">
<%	
    }
    else{
    	int count = 0;
    	String imagename = "";
for(Section s: sections){
	imagename = "sub"+(count%5);
	int classId = (int)s.getClassId();
	Class c = (Class)ClassDao.getClassWithId(classId);
%>
<div class="column" style="margin-top:30px">
    <div class="card">
      <img src="pics/<%=imagename%>.jpg" alt="Jane" style="height:180px;width:310px">
      <div class="container">
        <h2><%= c.getSubjectName() %></h2>
        <p class="title">Facutly Name: <%=c.getFacultyName()%></p>
        <p><%=c.getClassName()%></p>
        <p>Class Code:<%=c.getClassCode()%></p>
        <form action="ClassServlet?classId=<%=c.getClassId()%>" Method="post">
        <p><input type="submit" class="button" value="Enter Class Room"></button></p>
        </form>
      </div>
    </div>
  </div>
<%
count++;
}
    }
%>
      <script>
var modal1 = document.getElementById("myModal1");
var btn1 = document.getElementById("myBtn1");
var span1 = document.getElementsByClassName("close1")[0];
btn1.onclick = function() {
  modal1.style.display = "block";
}
span1.onclick = function() {
  modal1.style.display = "none";
}
window.onclick = function(event) {
  if (event.target == modal1) {
    modal1.style.display = "none";
  }
}
       </script>
</div>
</body>
</html>

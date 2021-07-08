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

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background:linear-gradient(to top, #00d2ff, #3a7bd5);;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
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
  height:40%;
}


.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
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
img.profile {
  border-radius: 50%;
}
img.profile1 {
  border-radius: 100%;
}
/* FORM TYPOGRAPHY*/

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
<body style="background-image:url('pics/bg3.png')">
<%
User user = new User();
    Section section = new Section();
    String username = (String)session.getAttribute("username");
    user = UserDao.getUser(username);
%>
<div style="width:100%;height:150px;background:linear-gradient(to bottom, #00d2ff, #3a7bd5);">
<table>
<th>
<div id="mySidenav" class="sidenav">
  <a style="text-decoration:none" href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <%if(user.getProfilePath() == null){
  %>
    <img class="profile1" src="pics/profile.png" height=150px width=170px>
     <form style="margin-top:20px;margin-left:30px" action="UpdateProfile?userId=<%=user.getUserId()%>" method="Post" enctype="multipart/form-data">
   <input type="file"  name="image"  id="file"  required"></br></br>
   <input style="background-color:#3a7bd5;color:white;padding:10px" type="submit" value="Update"></br></br>
</form>
<%}else{
	String srcPath = "http://localhost:8080/uploaded_files/"+user.getProfilePath();
	System.out.println("SrPath:"+srcPath);%>
  <img class="profile" src="<%=srcPath%>" height=180px width=170px>
   <%} %>
   <div style="margin-left:10px;margin-top:20px;background-color:white;height:10px;width:220px;border-radius:5px"></div>
   <center><h1 style=" font-family: Times New Roman;color:white;text-shadow:2px 2px #3a7bd5">Personal Details</h1>
  <h2 style=" font-family: 'Alegreya', serif"><%=user.getFirstName()+" "+user.getLastName()%></h2>
  <h4 style=" font-family: 'Alegreya', serif"><%=user.getEmail()%></h4>
  </center>
  <h3 style=" font-family: 'Alegreya', serif">RegisterNo : <%=user.getRegisterNo()%></h3>
  <h3 style=" font-family: 'Alegreya', serif">UserName : <%=user.getUserName()%></h3>

</div>
      <span   style="font-size:30px;cursor:pointer;color:white" onclick="openNav()"><p style="padding-top:35px;">&#9776;</p>
      </span>
 </th>
    <th>
    <h1 style="padding-top:20px;padding-left:30px;font-family: 'Alegreya', serif; font-size:50px;color:white"> Vishnu Classroom </h1>
     </th>
     <th>
     <div>
     <a href="login.html" style="text-decoration:none"><i class="fa fa-sign-out fa-2x" aria-hidden="true" style="color:white;padding-top:40px;padding-left:950px"></i><br/>
     <h2 style="color:white;font-family: 'Alegreya', serif; margin-top:-2px;padding-left:950px">Logout</h2></a>
     </div>
     </th>
     <table>
<div class="column" style="margin-top:100px;margin-left:400px">
    <div class="card">
      <img src="pics/teacher.png" alt="Jane" style="height:180px;width:310px">
      <div class="container">
        <form action="CreateClass.jsp" Method="post">
        <p><input type="submit" class="button" value="Teacher"></p>
        </form>
      </div>
    </div>
  </div>
<div class="column" style="margin-top:100px;margin-left:50px">
    <div class="card">
      <img src="pics/student.jpg" alt="Jane" style="height:180px;width:310px">
      <div class="container">
        <form action="JoinClass.jsp" Method="post">
        <p><input type="submit" class="button" value="Student"></button></p>
        </form>
      </div>
    </div>
  </div>
      <script>
      function openNav() {
    	  document.getElementById("mySidenav").style.width = "270px";
    	}

    	function closeNav() {
    	  document.getElementById("mySidenav").style.width = "0";
    	}
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

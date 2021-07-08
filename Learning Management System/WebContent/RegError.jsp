<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.login-block{
background: linear-gradient(to bottom, #00d2ff, #3a7bd5);
height:100%;
width:100%;
padding : 50px 0;
}
a:visited{
color:#3a7bd5;
}
a:link{
color:#3a7bd5;
}
a:active{
color:#00d2ff;
}
a:hover{
color:#00d2ff;
}
input{
height:30px
}
.container{background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1); height:700px}
.login-sec{padding: 10px 30px; position:relative;}
.login-sec .copy-text{position:absolute; width:80%; bottom:20px; font-size:13px; text-align:center;}
.login-sec .copy-text i{color:#FEB58A;}
.login-sec .copy-text a{color:#E36262;}
.login-sec h2{margin-bottom:30px; font-weight:800; font-size:30px; color: #3a7bd5;}
.login-sec h2:after{content:" "; width:100px; height:5px; background:#00d2ff; display:block; margin-top:20px; border-radius:3px; margin-left:auto;margin-right:auto}
.btn-login{background: #3a7bd5; color:#fff; font-weight:600;}
</style>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<div class="login-block">
    <div class="container">
<div class="row">
<div class="col-md-4 login-sec">
   <h2 class="text-center">Register Now</h2>
   <p style="color:red"><%=session.getAttribute("error") %>
   <form class="login-form" action="RegisterServlet" Method="post">
    <div class="form-group">
    <label style="color:#3a7bd5" class="text-uppercase">FirstName</label>
    <input type="text" name="firstName" class="form-control" placeholder="" required>
  </div> <div class="form-group">
    <label style="color:#3a7bd5" class="text-uppercase">LastName</label>
    <input type="text" name="lastName" class="form-control" placeholder="" required>
  </div>
  <div class="form-group">
    <label style="color:#3a7bd5" class="text-uppercase">E-mail Id</label>
    <input type="text" name="email" class="form-control" placeholder="" required>
  </div>
  <div class="form-group">
    <label style="color:#3a7bd5" class="text-uppercase">Username</label>
    <input type="text" name="userName" class="form-control" placeholder="" required>
  </div>
  <div class="form-group">
    <label style="color:#3a7bd5" class="text-uppercase">Password</label>
    <input type="password" name="password" class="form-control" placeholder="" required>
  </div>
  <div class="form-group">
    <label style="color:#3a7bd5" class="text-uppercase">Register No</label>
    <input type="text" name="registerNo" class="form-control" placeholder="" required>
  </div>
    <div class="form-check">
    <button type="submit" class="btn btn-login float-right">Register</button>
  </div>
  <div>
  <p style="padding-top:45px">Already have an account?
  <a href="login.html" style="text-decoration:none">Login</a></p>
  </div>
</form>      
</div>
<img src = "pics/logo.JPG" height = 600px width = 670px style = "padding-top:50px; padding-left:100px">
</div>
</div>
</div>
</body>
</html>
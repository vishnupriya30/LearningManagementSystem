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
padding : 130px 0;
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
.container{background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1); height:480px}
.login-sec{padding: 80px 30px; position:relative;}
.login-sec .copy-text{position:absolute; width:80%; bottom:20px; font-size:13px; text-align:center;}
.login-sec .copy-text i{color:#FEB58A;}
.login-sec .copy-text a{color:#E36262;}
.login-sec h2{margin-bottom:30px; font-weight:800; font-size:30px; color: #3a7bd5;}
.login-sec h2:after{content:" "; width:100px; height:5px; background:#00d2ff; display:block; margin-top:20px; border-radius:3px; margin-left:auto;margin-right:auto}
.btn-login{background: #3a7bd5; color:#fff; font-weight:600;}
</style>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<div class="login-block">
    <div class="container">
	<div class="row">
		<div class="col-md-4 login-sec">
		    <h2 class="text-center">Login Now</h2>
		    <form class="login-form" action="LoginServlet" Method = "get">
		    <p style="color:red">Please enter correct credentials!</p>
  <div class="form-group">
    <label for="exampleInputEmail1" style="color:#3a7bd5" class="text-uppercase" required>Username</label>
    <input type="text" name="username" class="form-control" placeholder="">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1" style="color:#3a7bd5" class="text-uppercase" required>Password</label>
    <input type="password" id = "pswd" name= "password" class="form-control" placeholder="">
  </div>
    <div class="form-check">
    <button type="submit" class="btn btn-login float-right">Login</button>
  </div>
  <div>
  <p style="padding-top:45px">Don't have an account?
  <a href="Register.html" style="text-decoration:none">Sign Up</a></p>
  </div>
</form>	       
</div>
<img src = "pics/logo.JPG" height = 450px width = 650px style = "padding-top:20px; padding-left:100px">
</div>
</div>
</div>
</body>
</html>
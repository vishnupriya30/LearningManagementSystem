<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dto.Quiz" import="com.dao.QuizDao"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css2?family=Alegreya:wght@600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  input[type=button], input[type=submit], input[type=reset]  {
  background-color: white;
  border: none;
  color: #3a7bd5;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 20px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 0px 10px 5px 2px;
}
  </style>
</head>
<body>
     
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-3" style="background-color:white;">
     <%
       int quizId = Integer.parseInt(request.getParameter("quizId"));
       Quiz quiz = QuizDao.getQuizByQuizId(quizId);
       String quizName = quiz.getQuizName();
       %>
    </div>
    <div class="col-sm-9" style="margin-top:30px;width:600px;height:150px;border:5px solid; box-shadow: 4px 4px lightgrey;background:linear-gradient(to bottom, #00d2ff, #3a7bd5); border-color:white">
       <center><h1 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5; text-transform: uppercase;"><%=quizName%></h1></center>
    </div>
  </div>
</div>
   <div class="container-fluid">
  <div class="row">    
       <div class="col-sm-3" style="background-color:white;">
       </div>
      <div class="col-sm-9" style="margin-top:30px;width:600px;height:300px;border:5px solid; box-shadow: 4px 4px lightgrey;background:linear-gradient(to bottom, #00d2ff, #3a7bd5); border-color:white">
      <center>
      <h2 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5">Your response has been Submitted</h2>
      <img src="pics/submitted.png" height="100px" width="100px">
      <h3 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5">Please visit Dashboard to view your Marks</h3>
      <h3 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5">Questions and Answers are displayed after the deadline</h3>
      </center>
    </div>
</div>
</div>
   <div class="container-fluid">
  <div class="row">
    <div class="col-sm-3" style="background-color:white;">
    </div>
    <div class="col-sm-9" style="margin-top:30px;width:600px;height:100px;margin-bottom:20px;border:5px solid; box-shadow: 4px 4px lightgrey;background:linear-gradient(to bottom, #00d2ff, #3a7bd5); border-color:white">
       <center><h1></h1></center>
       <a href="SubmittedQuiz.jsp"><input type="submit" value="Back"></a>
    </div>

  </div>
</div>
</body>
</html>
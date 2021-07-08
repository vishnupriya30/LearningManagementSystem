<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dto.Quiz"
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
       Quiz quiz = (Quiz)session.getAttribute("quiz");
       String quizName = quiz.getQuizName();
       %>
    </div>
    <div class="col-sm-9" style="margin-top:30px;width:600px;height:150px;border:5px solid; box-shadow: 4px 4px lightgrey;background:linear-gradient(to bottom, #00d2ff, #3a7bd5); border-color:white">
       <center><h1 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5; text-transform: uppercase;"><%=quizName%></h1></center>
    </div>
  </div>
</div>
    <form action="QuestionServlet" Method="post" enctype="multipart/form-data">
   <%
   int noq = quiz.getQuestions();
   int options = quiz.getMaxOptions();
   for(int i = 0 ; i < noq ; i++){
   %>
   <div class="container-fluid">
  <div class="row">    
       <div class="col-sm-3" style="background-color:white;">
       </div>
      <div class="col-sm-9" style="margin-top:30px;width:600px;height:450px;border:5px solid; box-shadow: 4px 4px lightgrey;background:linear-gradient(to bottom, #00d2ff, #3a7bd5); border-color:white">
      <%out.println(i+1);
      String qname = "question"+i;
      String iname="image"+i;
      %>
        <textarea placeholder="Enter the question" name = <%=qname%> style="width:550px;height:60px;margin-top:10px;" required> </textarea><br>
        <input type="file" name=<%=iname%> size="50" style="margin-top:15px;margin-left:135px"/>
        <h4 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5">Add Options</h4>
        <%
        for(int j = 0 ; j < options ; j++) {
         out.println(j+1);
         String opname = "option"+i+""+j;
         System.out.println(opname);
         if(j < 2){
         %>
        <input type="radio">
           <input type="text" name=<%=opname%> required></input><br><br>
        </input>
        <%}else{
        %><input type="radio">
           <input type="text" name=<%=opname%>></input><br><br>
        </input><%
         }
        }
        String ansname = "answer"+i;
        %>
         <h4 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5">Answer : </h4><input type="text" name=<%=ansname%> required>
    </div>
    <div class="col-sm-3" style="background-color:white;">
          </div>
</div>
</div>
    <%} %>
   
   <div class="container-fluid">
  <div class="row">
    <div class="col-sm-3" style="background-color:white;">
       
    </div>
    <div class="col-sm-9" style="margin-top:30px;width:600px;height:150px;margin-bottom:20px;border:5px solid; box-shadow: 4px 4px lightgrey;background:linear-gradient(to bottom, #00d2ff, #3a7bd5); border-color:white">
       <center><h1 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5"> Finish Quiz </h1></center>
       <input type="submit" value="Finish">
    </div>

  </div>
</div>
</form>
   
</body>
</html>
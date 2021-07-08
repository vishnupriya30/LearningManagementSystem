<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dto.Questions" import="com.dao.QuestionsDao" import="java.util.*"
    import="com.dto.Quiz" import="com.dao.QuizDao" import="com.dto.User"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
            function countDown(secs, elem)
            {
                var element = document.getElementById(elem);
                element.innerHTML = "<h2 style='color:white;margin-left:500px;margin-top:-40px'>"+secs+"\n<h4 style='color:white;margin-left:490px'>seconds</h4>";
                if(secs < 1) {
                    document.quiz.submit();
                }
                else
                {
                    secs--;
                    setTimeout('countDown('+secs+',"'+elem+'")',1500);
                }
            }

            function validate() {
                return true;
            }
            </script> 

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
       List<Questions> questions = QuestionsDao.getQuestionsByQuizId(quizId);
       String quizName = quiz.getQuizName();
       User user = (User)session.getAttribute("user");
       int userId = user.getUserId();
       int n = questions.size();
       %>
    </div>
    <div class="col-sm-9" style="margin-top:30px;width:600px;height:150px;border:5px solid; box-shadow: 4px 4px lightgrey;background:linear-gradient(to bottom, #00d2ff, #3a7bd5); border-color:white">
       <center><h1 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5; text-transform: uppercase;"><%=quizName%></h1></center>
       <div id="status"></div>
       <script type="text/javascript">countDown(<%=n*30%>,"status");</script>
    </div>
  </div>
</div>


    <form name="quiz" id="myquiz" onsubmit="return validate()" action="CorrectionServlet?quizId=<%=quizId%>" Method="post">
   <%
   for(int i = 0 ; i < n ; i++){
	   int k = (i+userId)%n;
   %>
   <div class="container-fluid">
  <div class="row">    
       <div class="col-sm-3" style="background-color:white;">
       </div>
      <div class="col-sm-9" style="margin-top:30px;width:600px;height:300px;border:5px solid; box-shadow: 4px 4px lightgrey;background:linear-gradient(to bottom, #00d2ff, #3a7bd5); border-color:white">
      <%
      String question = questions.get(k).getQuestion();
      if(question.length()>0){
    	  String[] allOptions = questions.get(k).getOptions().split("#");
    	  String ansname = "answer"+k;
    	  String imagePath = questions.get(k).getImage();
      %>
       <h3 style=" font-family: 'Alegreya', serif;"><%=(i+1)+".  "+question%></h3>
       <%if(imagePath != null){ %>
        <img src="http://localhost:8080/uploaded_files/<%=imagePath%>" height=200px width=200px style="margin-left:320px">
        <h3 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5;margin-top:-200px">Options</h3>
        <%}else{%>
       <h3 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5">Options</h3>
        <%}
        for(int j = 0 ; j < allOptions.length ; j++) {
        	char opt = (char)(97+j);
         out.println(opt);
         String optionName = allOptions[j];
         if(optionName.length() != 0){
        	 System.out.println(optionName);
         %>
            <input type="radio" name=<%=ansname%> value="<%=optionName%>" required>
             <label style=" font-family: 'Alegreya', serif;font-size:20px" for="<%=optionName%>"><%=optionName%></label><br>
        <%}
        }
        }  
        %>
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
       <center><h1 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5"> Submit Quiz </h1></center>
       <input type="submit" value="Submit">
    </div>

  </div>
</div>
</form>
   
</body>
</html>
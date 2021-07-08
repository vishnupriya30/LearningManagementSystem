<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dto.Questions" import="com.dao.QuestionsDao" import="java.util.*"
    import="com.dto.Quiz" import="com.dao.QuizDao" import="com.dto.Correction" import="com.dao.CorrectionDao"
    import="com.dto.Class" import="com.dto.User"
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
       List<Questions> questions = QuestionsDao.getQuestionsByQuizId(quizId);
       String quizName = quiz.getQuizName();
       %>
    </div>
    <div class="col-sm-9" style="margin-top:30px;width:600px;height:150px;border:5px solid; box-shadow: 4px 4px lightgrey;background:linear-gradient(to bottom, #00d2ff, #3a7bd5); border-color:white">
       <center><h1 style=" font-family: 'Alegreya', serif;color:white;text-shadow:2px 2px #3a7bd5; text-transform: uppercase;"><%=quizName%></h1></center>
    </div>
  </div>
</div>
   <%
   User user = (User)session.getAttribute("user");
   Class classroom = (Class)session.getAttribute("classroom");
   int userId = user.getUserId();
   int classId = classroom.getClassId();
   List<Correction> correction = CorrectionDao.getSubmittedQuizAfterCorrection(userId, classId, quizId);
   String attempted[] = correction.get(0).getAnswers().split("#");
   for(int i = 0 ; i < questions.size() ; i++){
   %>
   <div class="container-fluid">
  <div class="row">    
       <div class="col-sm-3" style="background-color:white;">
       </div>
      <div class="col-sm-9" style="margin-top:30px;width:600px;height:300px;border:5px solid; box-shadow: 4px 4px lightgrey;background:linear-gradient(to bottom, #00d2ff, #3a7bd5); border-color:white">
      <%
      String question = questions.get(i).getQuestion();
      if(question.length()>0){
    	  String answer = questions.get(i).getAnswer();
    	  String[] allOptions = questions.get(i).getOptions().split("#");
    	  String ansname = "answer"+i;
    	  String imagePath = questions.get(i).getImage();
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
         String optionName = allOptions[j];
         if(optionName.length() != 0){
        	 System.out.println(optionName);
        	 if(optionName.equals(answer)){
         %>
             <p style=" font-family: 'Alegreya', serif;font-size:20px;color:#75FD75"><%=(opt)+". "+optionName%> &#10004</p>
        <%}
        	 else if(optionName.equals(attempted[i]) && !attempted[i].equals(answer)){
        	        %>
        	        <p style=" font-family: 'Alegreya', serif;font-size:20px;color:#ec0b00"><%=(opt)+". "+optionName%>&#10008</p>
        	        <%
        	        	 }
         else{
        %>
        <p style=" font-family: 'Alegreya', serif;font-size:20px"><%=(opt)+". "+optionName%></p>
        <%
        	 }
        }
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
    <div class="col-sm-9" style="margin-top:30px;width:600px;height:100px;margin-bottom:20px;border:5px solid; box-shadow: 4px 4px lightgrey;background:linear-gradient(to bottom, #00d2ff, #3a7bd5); border-color:white">
       <center><h1></h1></center>
       <a href="SubmittedQuiz.jsp"><input type="submit" value="Back"></a>
    </div>

  </div>
</div>
</body>
</html>
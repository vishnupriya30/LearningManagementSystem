<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="com.dto.Quiz" import="com.dao.QuizDao" import="com.dto.Class"
     import="com.dto.Section" import="com.dao.SectionDao" import="com.dto.User" import="com.dto.Correction" import="com.dao.CorrectionDao"
     import="com.dto.Questions" import="com.dao.QuestionsDao"  import="com.dao.UserDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Alegreya:wght@600&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
function downloadCSV(csv, filename) {
	var csvFile;
	var downloadLink;
	
	csvFile = new Blob([csv], {type:"text/csv"});
	downloadLink = document.createElement("a");
	downloadLink.download = filename;
	downloadLink.href = window.URL.createObjectURL(csvFile);
	downloadLink.style.display = "none";
	
	document.body.appendChild(downloadLink);
	downloadLink.click();
	
}

function exportTableToCSV(filename){
	var csv = [];
	var rows = document.querySelectorAll(".marks tr");
	
	for(var i = 0;i < rows.length;i++){
		var row = [], cols = rows[i].querySelectorAll("td, th");
		for(var j = 0; j <cols.length; j++)
			row.push(cols[j].innerText);
		
		csv.push(row.join(","));
	}
	downloadCSV(csv.join("\n"),filename);
}
</script>
<style>
.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #3a7bd5;
  text-align: center;
  cursor: pointer;
  width: 4%;
}

.button:hover {
   background-color: orange;
}
#quiz {
  font-family: 'Alegreya', serif; 
  font-size:20px;
  border-collapse: collapse;
  width: 200%;
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
<%Class classroom = (Class)session.getAttribute("classroom");
List<Section> users = SectionDao.getUsers(classroom.getClassId());
User user = (User)session.getAttribute("user");
int userId = user.getUserId();
%>
<div style="background-image: url('pics/bg3.png');height:790px;width:100%">
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

<div class="row" style="margin-top:-20px">
  <div class="column" style="background:linear-gradient(to bottom, #00d2ff, #3a7bd5);width:200px;height:600px;">
  <a href="Classroom.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5;padding-left:10px;padding-top:40px">Stream</h2></a><br>
  <a href="Classwork.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5">Classwork</h2></a><br>
  <a href="People.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5;padding-left:10px">People</h2></a><br>
  <a href="Messages.jsp" style="text-decoration:none"><h2 style="color:white;font-family: 'Alegreya', serif;font-size:30px;text-shadow:2px 2px #3a7bd5;padding-left:10px">Messages</h2></a><br>
  </div>
</div>
</div>
<div>

   <% 
      int classId = classroom.getClassId();
      int quizId = (int)session.getAttribute("quizId");
      List<Correction> correction = CorrectionDao.getSubmittedQuizWithClassIdAndQuizId(classId,quizId);
      int n = correction.size();
     %>
</div>
<div style="margin-left:220px;margin-top:-600px">
<table>
<tr>
<td rowspan=2>
<table class="marks" id="quiz" style="margin-top:-250px">
<tr>
<th>Register No</th>
<th>StudentName</th>
<th>Marks</th>
</tr>
<%
Collections.sort(correction);
for(int i = 0 ; i < n ; i++){%>
<tr>
<%int userIdn = correction.get(i).getUserId();
User user1 = UserDao.getUser(userIdn);
%>
<td><%=user1.getRegisterNo()%></td>
<td><%=user1.getFirstName()+" "+user1.getLastName()%></td>
<td><%=correction.get(i).getMarks()%></td>
</tr>
<%} %>
</table>
</td>
<td>
<canvas id="myChart1" style="width:100%;max-width:300px;padding-left:550px"></canvas>
<script>
var xValues = '<%= session.getAttribute("labels") %>'.split(',');
var yValues = '<%= session.getAttribute("range") %>'.split(',');
var barColors = [
"#191970",
"#4682b4",
"#0000ff",
"#00bfff",
"#9400d3",
"#c154c1",
"#a6e7ff",
"#00003d",
];

new Chart("myChart1", {
  type: "pie",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "Count of Students for each Score"
    }
  }
});
</script>
</td>
</tr>
<tr>
<td>
<canvas id="myChart2" style="width:100%;max-width:400px;padding-left:500px"></canvas>
<script>
var yValues = '<%= session.getAttribute("studentMarks") %>'.split(',');
var xValues = '<%= session.getAttribute("studentNames") %>'.split(',');
new Chart("myChart2", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{
      fill: false,
      lineTension: 0,
      backgroundColor: "rgba(0,0,255,1.0)",
      borderColor: "rgba(0,0,255,0.1)",
      data: yValues
    }]
  },
  options: {
    legend: {display: false},
    scales: {
      yAxes: [{ticks: {min: 0, max:100}}],
    }
  }
});
</script>
<h4 style="padding-left:630px;padding-bottom:10px;font-family: 'Alegreya', serif;">Students Performance Chart</h4>
</td>
</tr>
</table>
<%
Quiz quiz = QuizDao.getQuizByQuizId(quizId);
String quizName =  quiz.getQuizName()+"_StudentMarks.csv";%>
<button style="margin-top:-610px;margin-left:1230px" class="button" onClick="exportTableToCSV('<%=quizName%>')"><i class="fa fa-download" aria-hidden="true"></i></button>
</body>
</html>

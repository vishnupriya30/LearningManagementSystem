<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.io.*,com.dto.User,java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*,javax.servlet.http.*,javax.servlet.*"
	import ="com.dto.Quiz,com.dao.QuizDao"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String result;
    User user = (User)session.getAttribute("user");
	//Recipient's email ID needs to be mentioned.
	String to = user.getEmail();
	// Sender's email ID needs to be mentioned
	String from = "vishnuclassroom4@gmail.com";
	final String username = "VishnuClassroom4";
	final String password = "A4vishnu@";

	// Assuming you are sending email through relay.jangosmtp.net
	String host = "smtp.gmail.com";

	Properties props = new Properties();
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", host);
	props.put("mail.smtp.port", "25");

	//Get the Session object.
	Session mailSession = Session.getInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username,
							password);
				}
			});
	Quiz quiz = (Quiz)session.getAttribute("attemptedQuiz");
	int quizId = quiz.getQuizId();
	int quizScore = (int)session.getAttribute("quizScore");

	try {
		// Create a default MimeMessage object.
		Message message = new MimeMessage(mailSession);

		// Set From: header field of the header.
		message.setFrom(new InternetAddress(from));

		// Set To: header field of the header.
		message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(to));

		// Set Subject: header field
		message.setSubject("Quiz Score");

		// Now set the actual message
		message.setText("Dear " +user.getFirstName()+" "+user.getLastName()+",\n"+"\nYou got "+quizScore+" marks in the "+quiz.getQuizName()+". Please login to Vishnu Classroom to view Dashboard.\n\n\nThanks & Regards\nVishnu Classroom");
		// Send message
		Transport.send(message);

		System.out.println("Sent message successfully....");
		result = "Sent message successfully....";

	} catch (MessagingException e) {
		e.printStackTrace();
		result = "Error: unable to send message....";
	}
	RequestDispatcher rd = request.getRequestDispatcher(
			"AssignedQuiz.jsp");
	rd.include(request, response);
	
%>

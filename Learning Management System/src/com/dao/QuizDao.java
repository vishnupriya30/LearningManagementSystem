package com.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.Class;
import com.dto.Quiz;
import com.dto.User;

public class QuizDao {
private SessionFactory factory = null;
	
	//To add a new quiz into the table. This method is invoked when teacher creates a new quiz
	public int register(Quiz quiz) {
		return HibernateTemplate.addObject(quiz);
	}
	
	//To get the list of quiz objects from database for a particular class
	public static List<Quiz> getQuiz(int classId){
		return (List)HibernateTemplate.getObjectListByQuery("From Quiz where classId="+classId);
	}
	
	//To get the quiz object from database based on quizId
	public static Quiz getQuizByQuizId(int quizId){
		return (Quiz)HibernateTemplate.getObject(Quiz.class,quizId);
	}
}

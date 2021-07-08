package com.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.Questions;
import com.dto.Quiz;

public class QuestionsDao {
private SessionFactory factory = null;
	
	//To add a question into the table. This method is invoked when teacher add a question in the quiz
	public int register(Questions questions) {
		return HibernateTemplate.addObject(questions);
	}
	
	//To get the list of questions from database for particular quiz
	public static List<Questions> getQuestionsByQuizId(int quizId){
		return (List)HibernateTemplate.getObjectListByQuery("From Questions where quizId="+quizId);
	}
}

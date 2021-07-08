package com.dao;

import java.util.List;

import com.db.HibernateTemplate;
import com.dto.Correction;
import com.dto.Notes;

public class CorrectionDao {
	
	//To add new row into the correction table
	public int register(Correction correction) {
		System.out.println("hello CorrectionDao");
		return HibernateTemplate.addObject(correction);
	}
	
	//To get the list of correction objects from database based on userId and classId
	public static List<Correction> getSubmittedQuiz(int userId,int classId){
		List<Correction> submittedQuiz = (List)HibernateTemplate.getObjectListByQuery("From Correction where classId=" + classId+" and userId="+userId);
		return submittedQuiz;
	}
	
	//To get the list of correction objects from database based on userId, classId and quizId
	public static List<Correction> getSubmittedQuizAfterCorrection(int userId,int classId,int quizId){
		List<Correction> submittedQuiz = (List)HibernateTemplate.getObjectListByQuery("From Correction where classId=" + classId+" and userId="+userId+" and quizId="+quizId);
		return submittedQuiz;
	}
	
	//To get the list of correction objects from database based on quizId and classId
	public static List<Correction> getSubmittedQuizWithClassIdAndQuizId(int classId,int quizId){
		List<Correction> submittedQuiz = (List)HibernateTemplate.getObjectListByQuery("From Correction where classId=" +classId+" and quizId="+quizId);
		return submittedQuiz;
	}
}

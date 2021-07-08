package com.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.Submissions;

public class SubmissionsDao {
private SessionFactory factory = null;
	
	//To add new submission object into the table. It is invoked when student submits the assignment
	public int register(Submissions submission) {
		return HibernateTemplate.addObject(submission);
	}
	
	//To get the list of submission objects from database based on classId and userId
	public static List<Submissions> getSubmissions(int classId,int userId){
		List<Submissions> submissions = (List)HibernateTemplate.getObjectListByQuery("From Submissions where classId=" + classId+" and userId="+userId);
		return submissions;
	}
	
	//To get the list of submission objects from database based on classId and assignmentId
	public static List<Submissions> getSubmissionsById(int assignmentId,int classId){
		List<Submissions> submissions = (List)HibernateTemplate.getObjectListByQuery("From Submissions where assignmentId=" +assignmentId+" and classId="+classId);
		return submissions;
	}
}

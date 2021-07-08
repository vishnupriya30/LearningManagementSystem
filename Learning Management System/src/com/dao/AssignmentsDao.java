package com.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.Assignments;

public class AssignmentsDao {
private SessionFactory factory = null;
	
	//To add new assignment into the table. It is invoked when teacher adds a assignment
	public int register(Assignments assignment) {
		return HibernateTemplate.addObject(assignment);
	}
	
	//To get the list of assignment objects from database based on classId
	public static List<Assignments> getAssignments(int classId){
		List<Assignments> assignment = (List)HibernateTemplate.getObjectListByQuery("From Assignments where classId=" + classId);
		return assignment;
	}
}

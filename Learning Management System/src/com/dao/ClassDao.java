package com.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.Class;
import com.dto.Section;

public class ClassDao {
private SessionFactory factory = null;
	
	//To get the class object from database whose classCode is equal to requested classCode
	public static Class getClass(String classCode) {
		return (Class)HibernateTemplate.getObjectByClassCode(classCode);
	}

	//To add new class into the table. It is invoked when user creates a new class
	public int register(Class classroom) {
		return HibernateTemplate.addObject(classroom);
	}
	
	//To get the class object from database whose classId is equal to requested classId
	public static Class getClass(int classId) {
		return (Class)HibernateTemplate.getObject(Class.class,classId);
	}
	
	//To get the list of class objects from database based on userId
	public static List<Class> getAllClasses(int userId) {
		List<Class> classes=(List)HibernateTemplate.getObjectListByQuery("From Class where userId=" + userId);	
		return classes;
	}
	
	//To get the class object from database whose classId is equal to requested classId
	public static Class getClassWithId(int classId) {
		Class classroom= (Class)HibernateTemplate.getObjectByClassId(classId);
		return classroom;
	}

}

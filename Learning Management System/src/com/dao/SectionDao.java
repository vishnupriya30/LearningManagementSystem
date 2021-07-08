package com.dao;

import java.util.List;

import com.db.HibernateTemplate;
import com.dto.Section;
import com.dto.User;

public class SectionDao {
	
	//To add a new entry into the section table. This method is invoked when user joins a class
	public int register(Section section) {
		return HibernateTemplate.addObject(section);
	}
	
	//To get the list of section objects from database based on UserId
	public static List<Section> getAllSections(int userId) {
		@SuppressWarnings("unchecked")
		List<Section> sections=(List)HibernateTemplate.getObjectListByQuery("From Section where userId=" + userId);
		return sections;
	}
	
	//To get the list of section objects from database based on classId
	public static List<Section> getUsers(int classId){
		List<Section> users = (List)HibernateTemplate.getObjectListByQuery("From Section where classId=" + classId);
		return users;
	}

}

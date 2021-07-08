package com.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.Notes;

public class NotesDao {
private SessionFactory factory = null;
	
	//To add new notes into the table. It is invoked when user uploads a file
	public int register(Notes notes) {
		System.out.println("hello user");
		return HibernateTemplate.addObject(notes);
	}
	
	//To get the list of notes objects from database based on classId
	public static List<Notes> getNotes(int classId){
		List<Notes> notes = (List)HibernateTemplate.getObjectListByQuery("From Notes where classId=" + classId);
		return notes;
	}
}

package com.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.db.HibernateTemplate;
import com.dto.Class;
import com.dto.User;

public class UserDao {
private SessionFactory factory = null;
	
	//To get the user object from database based on Username
	public static User getUser(String username) {

		return (User)HibernateTemplate.getObjectByUserName(username);
	}
	
	//To get the user object from database based on RegisterNo
	public static User getUserByRegisterNo(String registerNo) {

		return (User)HibernateTemplate.getObjectByRegisterNo(registerNo);
	}
	
	//To add profilePath in the user table
	public static int editProfilePath(User user) {
		return HibernateTemplate.updateObject(user);
	}
	
	//To add a user object into the user table. This method is invoked when registers an account
	public int register(User user) {
		System.out.println("hello user");
		return HibernateTemplate.addObject(user);
	}

	//To get the user object from database based on UserId
	public static User getUser(int id) {
		return (User)HibernateTemplate.getObject(User.class,id);
	}
	

}

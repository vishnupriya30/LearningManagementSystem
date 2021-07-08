package com.dao;

import java.util.List;

import com.db.HibernateTemplate;
import com.dto.Post;

public class PostDao {
	
	//To add new message into the table. This method is invoked when user posts a new message
	public int register(Post post) {
		return HibernateTemplate.addObject(post);
	}
	
	//To get the list of Post objects(Public Messages) from database whose classId is equal to requested classId
	public static List<Post> getAllPostsToClass(int classId){
		@SuppressWarnings("unchecked")
		List<Post> messages = (List)HibernateTemplate.getObjectListByQuery("From Post where toClassId=" +classId+" and toUserId=0");
		return messages;
	}
	
	//To get the list of Post objects(Private Messages) from database based on ClassId and UserId
	public static List<Post> getAllPostsToUser(int userId, int classId){
		@SuppressWarnings("unchecked")
		List<Post> messages = (List)HibernateTemplate.getObjectListByQuery("From Post where toUserId=" +userId+" and toClassId="+classId);
		return messages;
	}
}

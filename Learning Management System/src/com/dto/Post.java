/*Entity file of Post table
 * Columns in the table are written as variables
 */
package com.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="post")
public class Post {
	@Id
	private int postId;
	@Column(length=200)
	private String message;
	@Column
	private int fromUserId;
	@Column
	private int toUserId;
	@Column
	private int toClassId;
	@Column(length=15)
	private String date;
	
	//Default constructor
	public Post() {
		
	}
	
	//Parameterized constructor
	public Post(String message, int fromUserId, int toUserId, int toClassId, String date) {
		super();
		this.message = message;
		this.fromUserId = fromUserId;
		this.toUserId = toUserId;
		this.toClassId = toClassId;
		this.date = date;
	}
	
	//Getters and setters
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(int fromUserId) {
		this.fromUserId = fromUserId;
	}
	public int getToUserId() {
		return toUserId;
	}
	public void setToUserId(int toUserId) {
		this.toUserId = toUserId;
	}
	public int getToClassId() {
		return toClassId;
	}
	public void setToClassId(int toClassId) {
		this.toClassId = toClassId;
	}
}

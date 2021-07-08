/*Entity file of Assignments table
 * Columns in the table are written as variables
 */
package com.dto;

import java.io.InputStream;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="assignments")
public class Assignments {
	@Id
	private int assignmentId;
	@Column(length=50)
	private String assignmentName;
	@Column(length=50)
	private String assignmentPath;
	@Column(length=20)
	private String created;
	@Column(length=20)
	private String scheduled;
	@Column
	private int classId;
	@Column
	private int userId;
	
	//Default constructor
	public Assignments(){
		
	}

	//Parameterized Constructor
	public Assignments(String assignmentName, String assignmentPath, String created, String scheduled, int classId, int userId) {
		super();
		this.assignmentName = assignmentName;
		this.assignmentPath = assignmentPath;
		this.created = created;
		this.scheduled = scheduled;
		this.classId = classId;
		this.userId = userId;
	}

	//Getters and Setters
	public int getAssignmentId() {
		return assignmentId;
	}

	public void setAssignmentId(int assignmentId) {
		this.assignmentId = assignmentId;
	}

	public String getAssignmentName() {
		return assignmentName;
	}

	public void setAssignmentName(String assignmentName) {
		this.assignmentName = assignmentName;
	}

	public String getAssignmentPath() {
		return assignmentPath;
	}

	public void setAssignmentPath(String assignmentPath) {
		this.assignmentPath = assignmentPath;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getScheduled() {
		return scheduled;
	}

	public void setScheduled(String scheduled) {
		this.scheduled = scheduled;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}

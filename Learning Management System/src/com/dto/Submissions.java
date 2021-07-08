/*Entity file of Submissions table
 * Columns in the table are written as variables
 */
package com.dto;

import java.io.InputStream;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="submissions")
public class Submissions implements Comparable<Submissions> {
	@Id
	private int submissionId;
	@Column(length=50)
	private String submissionName;
	@Column(length=30)
	private String submittedDate;
	@Column
	private int userId;
	@Column
	private int classId;
	@Column
	private int assignmentId;
	@Column(length=20)
	private String registerNo;
	
	//Default constructor
	public Submissions(){
		
	}

	//Parameterized Constructor

	public Submissions(String submissionName, String submittedDate, int userId, int classId, int assignmentId, String registerNo) {
		super();
		this.submissionName = submissionName;
		this.submittedDate = submittedDate;
		this.userId = userId;
		this.classId = classId;
		this.assignmentId = assignmentId;
		this.registerNo = registerNo;
	}
	
	//Getters and Setters
	public int getSubmissionId() {
		return submissionId;
	}

	public void setSubmissionId(int submissionId) {
		this.submissionId = submissionId;
	}

	public String getSubmissionName() {
		return submissionName;
	}

	public void setSubmissionName(String submissionName) {
		this.submissionName = submissionName;
	}

	public String getSubmittedDate() {
		return submittedDate;
	}

	public void setSubmittedDate(String submittedDate) {
		this.submittedDate = submittedDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public int getAssignmentId() {
		return assignmentId;
	}

	public void setAssignmentId(int assignmentId) {
		this.assignmentId = assignmentId;
	}

	public String getRegisterNo() {
		return registerNo;
	}

	public void setRegisterNo(String registerNo) {
		this.registerNo = registerNo;
	}
	
	//overriding compareTo method, to sort objects based on Register number
	@Override
	public int compareTo(Submissions s)
    {
        return this.getRegisterNo().compareTo(s.getRegisterNo());
    }
	
}

/*Entity file of Class table
 * Columns in the table are written as variables
 */
package com.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="class")
public class Class {
	@Id
	private int classId;
	@Column(length=15)
	private String facultyName;
	@Column(length=30)
	private String subjectName;
	@Column(length=15)
	private String className;
	@Column(length=8)
	private String classCode;
	@Column
	private int userId;
	
	//Default Constructor
	public Class(){
		
	}
	
	//Parameterized Constructor
	public Class(String facultyName, String subjectName, String className, String classCode, int userId) {
		super();
		this.facultyName = facultyName;
		this.subjectName = subjectName;
		this.className = className;
		this.classCode = classCode;
		this.userId = userId;
	}
	
	//Getters and Setters
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public String getFacultyName() {
		return facultyName;
	}
	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
}

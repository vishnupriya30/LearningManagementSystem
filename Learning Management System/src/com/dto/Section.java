/*Entity file of section table
 * Columns in the table are written as variables
 */
package com.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="section")
public class Section {
	@Id
	private int sectionId;
	@Column
	private int userId;
	@Column
	private int classId;
	
	//Default constructor
	public Section(){
		
	}
	
	//Parameterized constructor
	public Section(int userId, int classId) {
		super();
		this.userId = userId;
		this.classId = classId;
	}
	
	//Getters and Setters
	public int getSectionId() {
		return sectionId;
	}
	public void setSectionId(int sectionId) {
		this.sectionId = sectionId;
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
	
	
}

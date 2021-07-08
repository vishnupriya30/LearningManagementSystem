/*Entity file of Notes table
 * Columns in the table are written as variables
 */
package com.dto;

import java.io.InputStream;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;


@Entity
@Table(name="notes")
public class Notes {
	@Id
	private int notesId;
	@Column(length=50)
	private String fileName;
	@Column(length=255)
	private String path;
	@Column(length=20)
	private String date;
	@Column
	private int classId;
	@Column
	private int userId;
	
	//Default constructor
	public Notes(){
		
	}

	//Parameterized Constructor
	public Notes(String fileName, String path, String date, int classId, int userId) {
		super();
		this.fileName = fileName;
		this.path = path;
		this.date = date;
		this.classId = classId;
		this.userId = userId;
	}

	//Getters and Setters
	public int getNotesId() {
		return notesId;
	}


	public void setNotesId(int notesId) {
		this.notesId = notesId;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
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

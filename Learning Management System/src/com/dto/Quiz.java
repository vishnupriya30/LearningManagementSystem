/*Entity file of Quiz table
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
@Table(name="quiz")
public class Quiz {
	@Id
	private int quizId;
	@Column(length=30)
	private String quizName;
	@Column(length=30)
	private String scheduled;
	@Column
	private int questions;
	@Column
	private int maxOptions;
	@Column
	private int classId;
	@Column(length=30)
	private String createdTime;
	
	//Default constructor
	public Quiz() {
		
	}

	//Parameterized constructor
	public Quiz(String quizName, String scheduled, int questions, int maxOptions, int classId,String createdTime) {
		super();
		this.quizName = quizName;
		this.scheduled = scheduled;
		this.questions = questions;
		this.maxOptions = maxOptions;
		this.classId = classId;
		this.createdTime = createdTime;
	}

	//Getters and Setters
	public String getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}

	public int getQuizId() {
		return quizId;
	}

	public void setQuizId(int quizId) {
		this.quizId = quizId;
	}

	public String getQuizName() {
		return quizName;
	}

	public void setQuizName(String quizName) {
		this.quizName = quizName;
	}

	public String getScheduled() {
		return scheduled;
	}

	public void setScheduled(String scheduled) {
		this.scheduled = scheduled;
	}

	public int getQuestions() {
		return questions;
	}

	public void setQuestions(int questions) {
		this.questions = questions;
	}

	public int getMaxOptions() {
		return maxOptions;
	}

	public void setMaxOptions(int maxOptions) {
		this.maxOptions = maxOptions;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}
	
	
}

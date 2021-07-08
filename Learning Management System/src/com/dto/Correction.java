/*Entity file of Correction table
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
@Table(name="correction")
public class Correction implements Comparable<Correction> {
	@Id
	private int correctionId;
	@Column(length=200)
	private String answers;
	@Column
	private int marks;
	@Column
	private int quizId;
	@Column
	private int classId;
	@Column
	private int userId;
	@Column(length=20)
	private String registerNo;
	
	//Default constructor
	public Correction(){
		
	}
	
	//Parameterized constructor
	public Correction(String answers, int marks, int quizId, int classId, int userId,String registerNo) {
		super();
		this.answers = answers;
		this.marks = marks;
		this.quizId = quizId;
		this.classId = classId;
		this.userId = userId;
		this.registerNo = registerNo;
	}

	//Getters and Setters
	public String getRegisterNo() {
		return registerNo;
	}

	public void setRegisterNo(String registerNo) {
		this.registerNo = registerNo;
	}

	public int getCorrectionId() {
		return correctionId;
	}

	public void setCorrectionId(int correctionId) {
		this.correctionId = correctionId;
	}

	public String getAnswers() {
		return answers;
	}

	public void setAnswers(String answers) {
		this.answers = answers;
	}

	public int getMarks() {
		return marks;
	}

	public void setMarks(int marks) {
		this.marks = marks;
	}

	public int getQuizId() {
		return quizId;
	}

	public void setQuizId(int quizId) {
		this.quizId = quizId;
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
	
	//overriding compareTo method to sort the objects of correction based on RegisterNo
	@Override public int compareTo(Correction c)
    {
        return this.getRegisterNo().compareTo(c.getRegisterNo());
    }
	
}

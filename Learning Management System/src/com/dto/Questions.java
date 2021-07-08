/*Entity file of question table
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
@Table(name="questions")
public class Questions {
	@Id
	private int questionId;
	@Column(length=200)
	private String question;
	@Column(length=200)
	private String options;
	@Column(length=40)
	private String answer;
	@Column
	private int quizId;
	@Column(length=50)
	private String image;
	
	//Default constructor
	public Questions(){
		
	}
	
	//Parameterized Constructor
	public Questions(String question, String options, String answer, int quizId, String image) {
		super();
		this.question = question;
		this.options = options;
		this.answer = answer;
		this.quizId = quizId;
		this.image = image;
	}
	
	//Getters and Setters
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getQuizId() {
		return quizId;
	}
	public void setQuizId(int quizId) {
		this.quizId = quizId;
	}
	
	
	
}

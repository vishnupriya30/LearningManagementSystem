/*Entity file of User table
 * Columns in the table are written as variables
 */
package com.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User implements Comparable<User>{
	@Id
	private int userId;
	@Column(length=15)
	private String registerNo;
	@Column(length=15)
	private String firstName;
	@Column(length=15)
	private String lastName;
	@Column(length=15)
	private String userName;
	@Column(length=15)
	private String password;
	@Column(length=255)
	private String profilePath;
	@Column(length=50)
	private String email;
	
	//Parameterized Constructor
	public User(String registerNo, String firstName, String lastName, String userName, String password,String email) {
		super();
		this.registerNo = registerNo;
		this.firstName = firstName;
		this.lastName = lastName;
		this.userName = userName;
		this.password = password;
		this.email = email;
	}

	//Default constructor
	public User() {
	}

	//Getters and Setters
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getRegisterNo() {
		return registerNo;
	}

	public void setRegisterNo(String registerNo) {
		this.registerNo = registerNo;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}
	
	//overriding compareTo method to sort the objects of user based on RegisterNo
	@Override
	public int compareTo(User u)
    {
        return this.getRegisterNo().compareTo(u.getRegisterNo());
    }
	
}

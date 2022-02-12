package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

@Entity(name="login")
public class Login {
	@Id
	@GeneratedValue
	private int id;
	
	@NotNull
	private String phone;
	
	@NotNull
	private String passWord;
	
	
	
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Login(String phone, String passWord) {
		super();
		this.phone = phone;
		this.passWord = passWord;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	
	
}



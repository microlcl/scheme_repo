package com.eastteam.myprogram.entity;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;


public class User{
	private String id;
	private String name;
	private String plainPassword;
	private String password;
	private String sex;
	private String departmentId;
	private String email;
	private String phoneNum;
	private String address;
	private String howmtown;
	private Date birthday;
	private Date registerDate;
	private String status;	
	private String comment;	

	public User() {
	}

	public User(String id) {
		this.id = id;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHowmtown() {
		return howmtown;
	}

	public void setHowmtown(String howmtown) {
		this.howmtown = howmtown;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@NotBlank
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	// 不显示在Restful接口的属性.
	@JsonIgnore
	public String getPlainPassword() {
		
		return plainPassword;
	}

	public void setPlainPassword(String plainPassword) {
		this.password = this.encode(plainPassword);
		this.plainPassword = plainPassword;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	// 设定JSON序列化时的日期格式
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
	private String encode(String plainPassword) {
		return "encode_" + plainPassword;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}

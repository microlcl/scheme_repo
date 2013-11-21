package com.eastteam.myprogram.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;


public class User extends BaseEntity{
	private String id;
	private String name;
	private String plainPassword;
	private String password;
	private String sex;
	private String email;
	private String phoneNum;
	private String address;
	private String hometown;
	private Date birthday;
	private Date registerDate;
	private String status;	
	private String comment;	
	
	private Department department;
	private List<Role> roles = Lists.newArrayList();
	private List<String> authorizedUriList;
	private List<String> authorizedFunctionList;
	
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

	public String getHometown() {
		return hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		try {
			 date = sdf.parse(birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.birthday = date;
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

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public List<String> getAuthorizedUriList() {
		return authorizedUriList;
	}

	public void setAuthorizedUriList(List<String> authorizedUriList) {
		this.authorizedUriList = authorizedUriList;
	}	
		
	public List<String> getAuthorizedFunctionList() {
		return authorizedFunctionList;
	}

	public void setAuthorizedFunctionList(List<String> authorizedFunctionList) {
		this.authorizedFunctionList = authorizedFunctionList;
	}

	public boolean checkPermission(String functionId) {
		if (authorizedFunctionList == null || authorizedFunctionList.isEmpty()) {
			return false;
		}
		
		return authorizedFunctionList.contains(functionId);
	}
	
}

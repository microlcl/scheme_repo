package com.eastteam.myprogram.entity;

public class Role extends BaseEntity {
	
	private String id;	
	private String name;	
	private String description;

	public String getRoleId() {
		return id;
	}

	public void setRoleId(String roleId) {
		this.id = roleId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}

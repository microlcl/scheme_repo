package com.eastteam.myprogram.entity;

public class Department extends BaseEntity {
	
	private String id;	
	private String name;
	private Department parent;	
	private String description;

	public String getId() {
		return id;
	}

	public void setId(String departmentId) {
		this.id = departmentId;
	}

	public Department getParent() {
		return parent;
	}

	public void setParent(Department parent) {
		this.parent = parent;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	

}

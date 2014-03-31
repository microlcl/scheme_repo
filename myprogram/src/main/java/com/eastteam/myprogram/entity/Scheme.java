package com.eastteam.myprogram.entity;

import java.util.Date;
import java.util.List;

public class Scheme extends IdEntity {
	
	private String name;
	private Case mycase;
	private List<Category> types;
	private String comment;
	private User creator;
	private Date modificationTimestamp;
	private List<Procedure> procedures;
	private Category status;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Case getMycase() {
		return mycase;
	}
	public void setMycase(Case mycase) {
		this.mycase = mycase;
	}
	public List<Category> getTypes() {
		return types;
	}
	public void setTypes(List<Category> types) {
		this.types = types;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public User getCreator() {
		return creator;
	}
	public void setCreator(User creator) {
		this.creator = creator;
	}
	public List<Procedure> getProcedures() {
		return procedures;
	}
	public void setProcedures(List<Procedure> procedures) {
		this.procedures = procedures;
	}
	public Date getModificationTimestamp() {
		return modificationTimestamp;
	}
	public void setModificationTimestamp(Date modificationTimestamp) {
		this.modificationTimestamp = modificationTimestamp;
	}
	public Category getStatus() {
		return status;
	}
	public void setStatus(Category status) {
		this.status = status;
	}

}

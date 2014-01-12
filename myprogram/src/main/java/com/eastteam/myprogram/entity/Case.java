package com.eastteam.myprogram.entity;

import java.util.Date;
import java.util.List;

/**
 * Case实体类
 * @author lichlei
 *
 */
public class Case extends IdEntity {
	public static final String businessCode = "c";
	
	private String title;
	private Department department;
	private User owner;
	private Category businessType;
	private Date eventTime;
	private int guestNum;
	private Spaces space;
	private String spaceTip;
	private String description;
	private Paper paper;
	private Category status;
	private List<Task> tasks;
	private Date createdTimestamp;
	// TODO 后续要加上到访，回访的entities list
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public User getOwner() {
		return owner;
	}
	public void setOwner(User owner) {
		this.owner = owner;
	}
	public Category getBusinessType() {
		return businessType;
	}
	public void setBusinessType(Category businessType) {
		this.businessType = businessType;
	}
	public Date getEventTime() {
		return eventTime;
	}
	public void setEventTime(Date eventTime) {
		this.eventTime = eventTime;
	}
	public int getGuestNum() {
		return guestNum;
	}
	public void setGuestNum(int guestNum) {
		this.guestNum = guestNum;
	}
	public Spaces getSpace() {
		return space;
	}
	public void setSpace(Spaces space) {
		this.space = space;
	}
	public String getSpaceTip() {
		return spaceTip;
	}
	public void setSpaceTip(String spaceTip) {
		this.spaceTip = spaceTip;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Paper getPaper() {
		return paper;
	}
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	public Category getStatus() {
		return status;
	}
	public void setStatus(Category status) {
		this.status = status;
	}
	public List<Task> getTasks() {
		return tasks;
	}
	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}
	public Date getCreatedTimestamp() {
		return createdTimestamp;
	}
	public void setCreatedTimestamp(Date createdTimestamp) {
		this.createdTimestamp = createdTimestamp;
	}
}

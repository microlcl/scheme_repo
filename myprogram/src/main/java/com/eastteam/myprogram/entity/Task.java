package com.eastteam.myprogram.entity;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author LB
 *
 */
public class Task extends IdEntity{
	private Task parent; //父task,为空就是没有父task，就是US
	private String summary; //类似于RTC中的summary，用作title
	private String description; //描述
	private Category taskType; // US的type
	private Category status;  //US的状态
	private Department department; // task所属的部门id
	private User owner; // task拥有者
	private int progress; //task进行百分百值
	private Category priority; //优先级，在category的系统参数节点配置
	
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm") 
	private Date dueDate; // 计划完成时间
	
	private int timeRemaining;  // 剩余多少时间
	
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm") 
	private Date createdTimestamp; // 创建时间
	
	private User createdBy;  // 创建人
	private List<Comment> comments;
	private List<Attachment> attachments;
	private Case cases;
	
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}

	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public int getTimeRemaining() {
		return timeRemaining;
	}
	public void setTimeRemaining(int timeRemaining) {
		this.timeRemaining = timeRemaining;
	}
	public Date getCreatedTimestamp() {
		return createdTimestamp;
	}
	public void setCreatedTimestamp(Date createdTimestamp) {
		this.createdTimestamp = createdTimestamp;
	}
	public Category getStatus() {
		return status;
	}
	public void setStatus(Category status) {
		this.status = status;
	}
	public Category getTaskType() {
		return taskType;
	}
	public void setTaskType(Category taskType) {
		this.taskType = taskType;
	}
	public Category getPriority() {
		return priority;
	}
	public void setPriority(Category priority) {
		this.priority = priority;
	}
	public Task getParent() {
		return parent;
	}
	public void setParent(Task parent) {
		this.parent = parent;
	}
	public User getOwner() {
		return owner;
	}
	public void setOwner(User owner) {
		this.owner = owner;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public User getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public List<Attachment> getAttachments() {
		return attachments;
	}
	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}
	public Case getCases() {
		return cases;
	}
	public void setCases(Case cases) {
		this.cases = cases;
	}
	
}

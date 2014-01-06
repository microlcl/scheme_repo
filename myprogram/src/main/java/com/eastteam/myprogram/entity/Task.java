package com.eastteam.myprogram.entity;

import java.util.Date;

public class Task extends IdEntity{
	private Long parent_id; //父task,为空就是没有父task，就是US
	private String summary; //类似于RTC中的summary，用作title
	private String description; //描述
	private String task_type; // US的type
	private String status;  //US的状态
	private String department_id; // task所属的部门id
	private String owner; // task拥有者
	private int progress; //task进行百分百值
	private String priority; //优先级，在category的系统参数节点配置
	private Date due_date; // 计划完成时间
	private int time_remaining;  // 剩余多少时间
	private Date created_timestamp; // 创建时间
	private String created_by;  // 创建人

	
	
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

	public String getTask_type() {
		return task_type;
	}

	public void setTask_type(String task_type) {
		this.task_type = task_type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public Date getDue_date() {
		return due_date;
	}

	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}

	public int getTime_remaining() {
		return time_remaining;
	}

	public void setTime_remaining(int time_remaining) {
		this.time_remaining = time_remaining;
	}

	public String getCreated_by() {
		return created_by;
	}

	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}

	public Date getCreated_timestamp() {
		return created_timestamp;
	}

	public void setCreated_timestamp(Date created_timestamp) {
		this.created_timestamp = created_timestamp;
	}

	public Long getParent_id() {
		return parent_id;
	}

	public void setParent_id(Long parent_id) {
		this.parent_id = parent_id;
	}
}

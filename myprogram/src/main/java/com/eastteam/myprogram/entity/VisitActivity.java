/**
 * 
 */
package com.eastteam.myprogram.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author LSS
 *
 */
public class VisitActivity extends IdEntity {
	
	private String customerId;
	private Category visitType;
	
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm") 
	private Date visitTime;
	
	private int visitNum;
	private Department assignedDepartment;
	private User recipient;
	private User operator;
	private Category businessType;
	private Case thisCase;
	private String isVisited;
	private String comment;
	private Paper paper;
	
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public Category getVisitType() {
		return visitType;
	}
	public void setVisitType(Category visitType) {
		this.visitType = visitType;
	}
	public Date getVisitTime() {
		return visitTime;
	}
	public void setVisitTime(Date visitTime) {
		this.visitTime = visitTime;
	}
	public int getVisitNum() {
		return visitNum;
	}
	public void setVisitNum(int visitNum) {
		this.visitNum = visitNum;
	}
	public Department getAssignedDepartment() {
		return assignedDepartment;
	}
	public void setAssignedDepartment(Department assignedDepartment) {
		this.assignedDepartment = assignedDepartment;
	}
	public User getRecipient() {
		return recipient;
	}
	public void setRecipient(User recipient) {
		this.recipient = recipient;
	}
	public User getOperator() {
		return operator;
	}
	public void setOperator(User operator) {
		this.operator = operator;
	}
	public Category getBusinessType() {
		return businessType;
	}
	public void setBusinessType(Category businessType) {
		this.businessType = businessType;
	}
	public Case getThisCase() {
		return thisCase;
	}
	public void setThisCase(Case thisCase) {
		this.thisCase = thisCase;
	}
	public String getIsVisited() {
		return isVisited;
	}
	public void setIsVisited(String isVisited) {
		this.isVisited = isVisited;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Paper getPaper() {
		return paper;
	}
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	
	
	
	

}

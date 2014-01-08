/**
 * 
 */
package com.eastteam.myprogram.entity;

import java.util.Date;

/**
 * @author LSS
 *
 */
public class VisitActivity extends IdEntity {
	
	private String customerId;
	private Category visitType;
	private Date visitTime;
	private int visitNum;
	private Department assignedDepartment;
	private String recipient;
	private String operator;
	private Category businessType;
	private Case thisCase;
	private boolean isVisited;
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
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
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
	public boolean isVisited() {
		return isVisited;
	}
	public void setVisited(boolean isVisited) {
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

/**
 * 
 */
package com.eastteam.myprogram.web.visit;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.eastteam.myprogram.entity.Category;
import com.eastteam.myprogram.entity.Customer;
import com.eastteam.myprogram.entity.Paper;
import com.eastteam.myprogram.entity.User;
import com.eastteam.myprogram.web.BaseFormBean;

/**
 * @author LSS
 *
 */
public class VisitFormBean extends BaseFormBean {
	
	private Long visitId;
	private Long customerId;
	private Long caseId;
	private Category visitType;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm") 
	private Date visitTime;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date eventTime;
	
	private int visitNum;
	private Category businessType;
	private String isVisited;
	private String comment;
	private int guestNum;
	private String spaceTip;
//	private String customerName;
	private String caseTitle;
	private Paper paper;
	private User operator;
	private Customer customer;
	
	public Long getVisitId() {
		return visitId;
	}
	public void setVisitId(Long visitId) {
		this.visitId = visitId;
	}
	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	public Long getCaseId() {
		return caseId;
	}
	public void setCaseId(Long caseId) {
		this.caseId = caseId;
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
	public Category getBusinessType() {
		return businessType;
	}
	public void setBusinessType(Category businessType) {
		this.businessType = businessType;
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
	public String getSpaceTip() {
		return spaceTip;
	}
	public void setSpaceTip(String spaceTip) {
		this.spaceTip = spaceTip;
	}
//	public String getCustomerName() {
//		return customerName;
//	}
//	public void setCustomerName(String customerName) {
//		this.customerName = customerName;
//	}
	public String getCaseTitle() {
		return caseTitle;
	}
	public void setCaseTitle(String caseTitle) {
		this.caseTitle = caseTitle;
	}
	public Paper getPaper() {
		return paper;
	}
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	public User getOperator() {
		return operator;
	}
	public void setOperator(User operator) {
		this.operator = operator;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
}

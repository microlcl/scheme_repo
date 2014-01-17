/**
 * 
 */
package com.eastteam.myprogram.web.visit;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.eastteam.myprogram.entity.Category;
import com.eastteam.myprogram.web.BaseFormBean;

/**
 * @author LSS
 *
 */
public class VisitFormBean extends BaseFormBean {
	
	private Category visitType;
	private Date visitTime;
	private int visitNum;
	private Category businessType;
	private String isVisited;
	private String comment;
	private Date eventTime;
	private int guestNum;
	private String spaceTip;
	private String customerName;
	private String caseTitle;
	
	public Category getVisitType() {
		return visitType;
	}
	public void setVisitType(Category visitType) {
		this.visitType = visitType;
	}
	public Date getVisitTime() {
		return visitTime;
	}
	public void setVisitTime(String visitTime) {
		if(visitTime != null && visitTime != ""){	
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date date = new Date();
			try {
				date = sdf.parse(visitTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.visitTime = date;
		}
		else 
			this.visitTime = null;
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
	public void setEventTime(String eventTime) {
		if(eventTime != null && eventTime != ""){	
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date date = new Date();
			try {
				date = sdf.parse(eventTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.eventTime = date;
		}
		else 
			this.visitTime = null;
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
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCaseTitle() {
		return caseTitle;
	}
	public void setCaseTitle(String caseTitle) {
		this.caseTitle = caseTitle;
	}
	
	
	

}

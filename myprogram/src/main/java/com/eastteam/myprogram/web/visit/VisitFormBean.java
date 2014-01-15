/**
 * 
 */
package com.eastteam.myprogram.web.visit;

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
	
	
	

}

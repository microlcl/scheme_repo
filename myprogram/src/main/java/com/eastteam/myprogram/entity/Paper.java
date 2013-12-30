/**
 * 
 */
package com.eastteam.myprogram.entity;


/**
 * @author LSS
 *
 */
public class Paper extends IdEntity {
	
	private String paperName;
	private Category businessType;
	private Category status;
	
	
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	public Category getBusinessType() {
		return businessType;
	}
	public void setBusinessType(Category businessType) {
		this.businessType = businessType;
	}
	public Category getStatus() {
		return status;
	}
	public void setStatus(Category status) {
		this.status = status;
	}
	
	
}

/**
 * 
 */
package com.eastteam.myprogram.entity;

import java.util.List;

/**
 * @author LSS
 *
 */
public class Paper extends IdEntity {
	
	private String paper_name;
	private List<Category> business_type;
	private String status;
	
	public String getPaper_name() {
		return paper_name;
	}
	public void setPaper_name(String paper_name) {
		this.paper_name = paper_name;
	}
	public List<Category> getBusiness_type() {
		return business_type;
	}
	public void setBusiness_type(List<Category> business_type) {
		this.business_type = business_type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
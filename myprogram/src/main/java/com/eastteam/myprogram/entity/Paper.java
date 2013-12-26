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
	private boolean trashed;
	
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
	public boolean isTrashed() {
		return trashed;
	}
	public void setTrashed(boolean trashed) {
		this.trashed = trashed;
	}
	
	
}

package com.eastteam.myprogram.entity;

import java.util.Date;
import java.util.List;

public class Media extends IdEntity{
	private String mediaType;
	private String path;
	private String status;
	private String description;
	private Date uploadTimestamp;
	private String userId;
	private List<Category> categorys;
	private String title;
	
	public Media() {
		
	}
	
	public Media(String path, String status) {
		this.path = path;
		this.status = status;
	}

	public String getMediaType() {
		return mediaType;
	}
	public void setMediaType(String mediaType) {
		this.mediaType = mediaType;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Date getUploadTimestamp() {
		return uploadTimestamp;
	}
	public void setUploadTimestamp(Date uploadTimestamp) {
		this.uploadTimestamp = uploadTimestamp;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Category> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}	
	

}

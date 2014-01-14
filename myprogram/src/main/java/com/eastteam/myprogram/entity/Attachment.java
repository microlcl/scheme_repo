package com.eastteam.myprogram.entity;

import java.util.Date;

public class Attachment extends IdEntity{
	private User user;
	private Date uploadedTimestamp;
	private String path;
	private int fileSize;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getUploadedTimestamp() {
		return uploadedTimestamp;
	}
	public void setUploadedTimestamp(Date uploadedTimestamp) {
		this.uploadedTimestamp = uploadedTimestamp;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	
	
}

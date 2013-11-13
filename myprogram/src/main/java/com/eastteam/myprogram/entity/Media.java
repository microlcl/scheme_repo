package com.eastteam.myprogram.entity;

import java.util.Date;

public class Media extends IdEntity{
	private String title;
	private String mediaType;
	private String path;
	private String trashed;
	private String description;
	private Date uploadTimestamp;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getTrashed() {
		return trashed;
	}
	public void setTrashed(String trashed) {
		this.trashed = trashed;
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

}

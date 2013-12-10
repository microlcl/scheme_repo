package com.eastteam.myprogram.web.media;

import java.util.List;

import com.eastteam.myprogram.web.BaseFormBean;

public class MediaFormBean extends BaseFormBean {
	
	private List<MediaWrapper> medias;
	
	private String description;
	
	private String title;
	
	private String categoryId;
	
	private String mediaType;
	
	private String author;

	public List<MediaWrapper> getMedias() {
		return medias;
	}

	public void setMedias(List<MediaWrapper> medias) {
		this.medias = medias;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}	
	
	
	

}

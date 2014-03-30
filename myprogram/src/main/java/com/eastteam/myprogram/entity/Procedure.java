package com.eastteam.myprogram.entity;

import java.util.List;

public class Procedure  extends IdEntity {
	
	private String name;
	private String description;
	private Category businessType;
	private List<MediaExt> medias;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Category getBusinessType() {
		return businessType;
	}
	public void setBusinessType(Category businessType) {
		this.businessType = businessType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<MediaExt> getMedias() {
		return medias;
	}
	public void setMedias(List<MediaExt> medias) {
		this.medias = medias;
	}

	
}

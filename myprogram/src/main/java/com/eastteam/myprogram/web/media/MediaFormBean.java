package com.eastteam.myprogram.web.media;

import java.util.List;

import com.eastteam.myprogram.entity.Media;
import com.eastteam.myprogram.web.BaseFormBean;

public class MediaFormBean extends BaseFormBean {
	
	private List<Media> medias;
	
	private String description;

	public List<Media> getMedias() {
		return medias;
	}

	public void setMedias(List<Media> medias) {
		this.medias = medias;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	

}
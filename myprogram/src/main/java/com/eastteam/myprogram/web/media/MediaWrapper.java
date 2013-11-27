package com.eastteam.myprogram.web.media;

import com.eastteam.myprogram.entity.Media;

public class MediaWrapper extends Media {
	private String categoryIds;

	public String getCategoryIds() {
		return categoryIds;
	}

	public void setCategoryIds(String categoryIds) {
		this.categoryIds = categoryIds;
	}	

}

package com.eastteam.myprogram.entity;

import java.math.BigDecimal;
import java.util.List;

public class Product extends IdEntity{
	private String title;
	private String status;
	private String description;
	private String defaultPictureId;
	private BigDecimal price;
	private List<Category> categories;
	private Media media;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public List<Category> getCategorys() {
		return categories;
	}
	public void setCategorys(List<Category> categorys) {
		this.categories = categorys;
	}
	public Media getMedia() {
		return media;
	}
	public void setMedia(Media media) {
		this.media = media;
	}
	public String getDefaultPictureId() {
		return defaultPictureId;
	}
	public void setDefaultPictureId(String defaultPictureId) {
		this.defaultPictureId = defaultPictureId;
	}
	public List<Category> getCategories() {
		return categories;
	}
	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
	
}

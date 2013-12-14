package com.eastteam.myprogram.entity;

import java.math.BigDecimal;
import java.util.List;

public class Product extends IdEntity{
	private String title;
	private String status;
	private String description;
	private String default_picture_id;
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
	public String getDefault_picture_id() {
		return default_picture_id;
	}
	public void setDefault_picture_id(String default_picture_id) {
		this.default_picture_id = default_picture_id;
	}

	
}

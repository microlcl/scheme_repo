package com.eastteam.myprogram.entity;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

public class Product extends IdEntity{
	private Long product_id;
	private String title;
	private String status;
	private String description;
	private BigDecimal price;
	private List<Category> categorys;
	private List<Media> medias; 
	public Long getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Long product_id) {
		this.product_id = product_id;
	}
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
		return categorys;
	}
	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}
	public List<Media> getMedias() {
		return medias;
	}
	public void setMedias(List<Media> medias) {
		this.medias = medias;
	}
	
}

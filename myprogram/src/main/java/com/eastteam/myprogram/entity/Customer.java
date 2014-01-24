/**
 * 
 */
package com.eastteam.myprogram.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author LSS
 *
 */
public class Customer extends IdEntity {

	private String customerName;
	private String customerPhone;
	private String customerSex;
	private String job;
	private String weixin;
	private String weibo;
	private String qq;
	
	@DateTimeFormat(pattern="yyyy-MM-dd") 
	private Date birthday;
	
	private String favorate;
	private String description;
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	public String getCustomerSex() {
		return customerSex;
	}
	public void setCustomerSex(String customerSex) {
		this.customerSex = customerSex;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getWeixin() {
		return weixin;
	}
	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}
	public String getWeibo() {
		return weibo;
	}
	public void setWeibo(String weibo) {
		this.weibo = weibo;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getFavorate() {
		return favorate;
	}
	public void setFavorate(String favorate) {
		this.favorate = favorate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
}

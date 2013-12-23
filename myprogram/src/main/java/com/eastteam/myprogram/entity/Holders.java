package com.eastteam.myprogram.entity;

import java.util.List;

public class Holders extends IdEntity{
	private String holder_name; //场地名称
	private String address ; //场地地址
	private int level ;//星级：0，1,2,3,4,5
	private String contact ;//联系人名称
	private String phone ;//联系电话
	private String description ;//场地描述 
	private List<Spaces> spaces;
	public String getHolder_name() {
		return holder_name;
	}
	public void setHolder_name(String holder_name) {
		this.holder_name = holder_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<Spaces> getSpaces() {
		return spaces;
	}
	public void setSpaces(List<Spaces> spaces) {
		this.spaces = spaces;
	}
	
}

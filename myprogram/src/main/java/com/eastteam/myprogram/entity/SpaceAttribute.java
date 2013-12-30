package com.eastteam.myprogram.entity;

public class SpaceAttribute extends BaseEntity{
	private long space_id;
	private String attribute_id;
	public long getSpace_id() {
		return space_id;
	}
	public void setSpace_id(long space_id) {
		this.space_id = space_id;
	}
	public String getAttribute_id() {
		return attribute_id;
	}
	public void setAttribute_id(String attribute_id) {
		this.attribute_id = attribute_id;
	}
	
}

package com.eastteam.myprogram.entity;

public class Spaces extends IdEntity{
	private String space_name; //会场名称
	private int floor;//会场所在楼层
	private int volume ;//容纳人数
	private int hall_height ;//楼层空间高度
	private int stage_length ;//舞台长
	private int stage_width ;//舞台宽
	private int stage_height;//舞台高
	private String description;
	private Holders holders ;//所属holder
	
	public Holders getHolders() {
		return holders;
	}
	public void setHolders(Holders holders) {
		this.holders = holders;
	}
	public String getSpace_name() {
		return space_name;
	}
	public void setSpace_name(String space_name) {
		this.space_name = space_name;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
	}
	public int getHall_height() {
		return hall_height;
	}
	public void setHall_height(int hall_height) {
		this.hall_height = hall_height;
	}
	public int getStage_length() {
		return stage_length;
	}
	public void setStage_length(int stage_length) {
		this.stage_length = stage_length;
	}
	public int getStage_width() {
		return stage_width;
	}
	public void setStage_width(int stage_width) {
		this.stage_width = stage_width;
	}
	public int getStage_height() {
		return stage_height;
	}
	public void setStage_height(int stage_height) {
		this.stage_height = stage_height;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}

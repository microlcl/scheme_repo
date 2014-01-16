package com.eastteam.myprogram.entity;

/**
 * 问题选项
 * @author lichlei
 *
 */
public class Option extends BaseEntity{
	private String content;
	boolean checked = false;
	
	public Option() {
		
	}
	
	public Option(String content) {
		this.content = content;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	

}

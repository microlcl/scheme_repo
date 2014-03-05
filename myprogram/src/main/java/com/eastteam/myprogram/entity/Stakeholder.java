package com.eastteam.myprogram.entity;

public class Stakeholder extends BaseEntity {
	private String key;
	/**角色**/
	private Category character;
	private Customer customer;
	private String description;
	/**是否是默认角色**/
	private boolean required;
	public Category getCharacter() {
		return character;
	}
	public void setCharacter(Category character) {
		this.character = character;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isRequired() {
		return required;
	}
	public void setRequired(boolean required) {
		this.required = required;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	

}

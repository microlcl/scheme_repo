package com.eastteam.myprogram.entity;

public class Stakeholder extends BaseEntity {
	/**角色**/
	private Category character;
	private Customer customer;
	private String description;
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
	

}

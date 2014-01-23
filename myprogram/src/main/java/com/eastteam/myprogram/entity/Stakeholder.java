package com.eastteam.myprogram.entity;

public class Stakeholder extends BaseEntity {
	/**角色**/
	private Category character;
	private Customer customer;
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
	

}

package com.eastteam.myprogram.entity;

/**
 * 构建方案的时候，需要知道需要多少个product，所以扩展一下Product
 * @author lichlei
 *
 */
public class ProductExt extends Product {
	
	/**所需数量**/
	private int quantity;


	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}

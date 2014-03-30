package com.eastteam.myprogram.entity;

/**
 * 构建方案的时候专用
 * @author lichlei
 *
 */
public class MediaExt extends Media {
	/**在导出的html5效果中的位置**/
	private int position;
	
	/**此media是否属于某一个product**/
	private ProductExt product;

	public int getPosition() {
		return position;
	}

	public void setPosition(int position) {
		this.position = position;
	}

	public ProductExt getProduct() {
		return product;
	}

	public void setProduct(ProductExt product) {
		this.product = product;
	}	
}

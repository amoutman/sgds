package com.creditease.sgds.cart.bean;

import java.math.BigDecimal;

public class CartDetails {
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getShoppingCartId() {
		return shoppingCartId;
	}
	public void setShoppingCartId(String shoppingCartId) {
		this.shoppingCartId = shoppingCartId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	private String id;
	private String shoppingCartId;
	private String productId;
	private int count;
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductMasterPic() {
		return productMasterPic;
	}
	public void setProductMasterPic(String productMasterPic) {
		this.productMasterPic = productMasterPic;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	private String productName;
	private String productMasterPic;
	private BigDecimal price;
	private String unit;

}

package com.creditease.sgds.product.bean;

import java.util.Date;

public class ProductReview {
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getDescInfo() {
		return descInfo;
	}
	public void setDescInfo(String descInfo) {
		this.descInfo = descInfo;
	}
	public Date getCreatedByDate() {
		return createdByDate;
	}
	public void setCreatedByDate(Date createdByDate) {
		this.createdByDate = createdByDate;
	}
	public String getCreatedById() {
		return createdById;
	}
	public void setCreatedById(String createdById) {
		this.createdById = createdById;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	private String id;
	private String productId;
	private int level;
	private String descInfo;
	private Date createdByDate;
	private String createdById;
	private String createdBy;
}

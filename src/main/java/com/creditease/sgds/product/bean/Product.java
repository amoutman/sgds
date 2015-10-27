package com.creditease.sgds.product.bean;

import java.math.BigDecimal;
import java.util.Date;

public class Product {
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public String getProductMasterPic() {
		return productMasterPic;
	}
	public void setProductMasterPic(String productMasterPic) {
		this.productMasterPic = productMasterPic;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getCouponSupport() {
		return couponSupport;
	}
	public void setCouponSupport(int couponSupport) {
		this.couponSupport = couponSupport;
	}
	public int getActivityProduct() {
		return activityProduct;
	}
	public void setActivityProduct(int activityProduct) {
		this.activityProduct = activityProduct;
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
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateById() {
		return updateById;
	}
	public void setUpdateById(String updateById) {
		this.updateById = updateById;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	private String id;
	private String categoryId;
	private String productName;
	private String productCode;
	private String productDesc;
	private String productMasterPic;
	private int status;
	private int couponSupport;
	private int activityProduct;
	private Date createdByDate;
	private String createdById;
	private String createdBy;
	private Date updateDate;
	private String updateById;
	private String updateBy;
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
	private BigDecimal price;
	private String unit;
	private String productDetailsMasterPicPath;
	public String getProductDetailsMasterPicPath() {
		return productDetailsMasterPicPath;
	}
	public void setProductDetailsMasterPicPath(String productDetailsMasterPicPath) {
		this.productDetailsMasterPicPath = productDetailsMasterPicPath;
	}
}

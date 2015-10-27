package com.creditease.sgds.product.bean;

import java.util.Date;

public class Category {
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryDesc() {
		return categoryDesc;
	}
	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getCategoryPicPath() {
		return categoryPicPath;
	}
	public void setCategoryPicPath(String categoryPicPath) {
		this.categoryPicPath = categoryPicPath;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	private String id;
	private String categoryName;
	private String categoryDesc;
	private String level;
	private String pid;
	private String categoryPicPath;
	private Date createdByDate;
	private String createdById;
	private String createdBy;
	private Date updateDate;
	private String updateById;
	private String updateBy;
	private int status;

}

package com.creditease.sgds.cart.bean;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class Cart {
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public BigDecimal getSettleAmount() {
		return settleAmount;
	}
	public void setSettleAmount(BigDecimal settleAmount) {
		this.settleAmount = settleAmount;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	private String id;
	private String userId;
	private BigDecimal settleAmount;
	private Date createdDate;
	private Date updatedDate;
	
	private List<CartDetails> cdList;

	public List<CartDetails> getCdList() {
		return cdList;
	}
	public void setCdList(List<CartDetails> cdList) {
		this.cdList = cdList;
	}
}

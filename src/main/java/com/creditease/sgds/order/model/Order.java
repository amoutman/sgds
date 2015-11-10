package com.creditease.sgds.order.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.creditease.sgds.user.model.Receiver;

public class Order {
    private String id;

    private String orderNo;

    private String receiverId;

    private Integer distributionMode;

    private String eta;

    private Integer payMode;

    private String couponId;

    private BigDecimal productTotalAmount;

    private BigDecimal carriage;

    private BigDecimal couponAmount;

    private BigDecimal practticalCoping;

    private Integer status;

    private Date createdDate;

    private String createdById;

    private String createdBy;

    private Date updateDate;

    private Date receivedDate;
    
    private String productIds;
    
    private Receiver receiver;
    
    private Integer productCount;
    
    private List<OrderDetails> odList;
    
    public List<OrderDetails> getOdList() {
		return odList;
	}

	public void setOdList(List<OrderDetails> odList) {
		this.odList = odList;
	}

	public Integer getProductCount() {
		return productCount;
	}

	public void setProductCount(Integer productCount) {
		this.productCount = productCount;
	}

    public Receiver getReceiver() {
		return receiver;
	}

	public void setReceiver(Receiver receiver) {
		this.receiver = receiver;
	}

	public String getProductIds() {
		return productIds;
	}

	public void setProductIds(String productIds) {
		this.productIds = productIds;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }

    public String getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(String receiverId) {
        this.receiverId = receiverId == null ? null : receiverId.trim();
    }

    public Integer getDistributionMode() {
        return distributionMode;
    }

    public void setDistributionMode(Integer distributionMode) {
        this.distributionMode = distributionMode;
    }

    public String getEta() {
        return eta;
    }

    public void setEta(String eta) {
        this.eta = eta;
    }

    public Integer getPayMode() {
        return payMode;
    }

    public void setPayMode(Integer payMode) {
        this.payMode = payMode;
    }

    public String getCouponId() {
        return couponId;
    }

    public void setCouponId(String couponId) {
        this.couponId = couponId == null ? null : couponId.trim();
    }

    public BigDecimal getProductTotalAmount() {
        return productTotalAmount;
    }

    public void setProductTotalAmount(BigDecimal productTotalAmount) {
        this.productTotalAmount = productTotalAmount;
    }

    public BigDecimal getCarriage() {
        return carriage;
    }

    public void setCarriage(BigDecimal carriage) {
        this.carriage = carriage;
    }

    public BigDecimal getCouponAmount() {
        return couponAmount;
    }

    public void setCouponAmount(BigDecimal couponAmount) {
        this.couponAmount = couponAmount;
    }

    public BigDecimal getPractticalCoping() {
        return practticalCoping;
    }

    public void setPractticalCoping(BigDecimal practticalCoping) {
        this.practticalCoping = practticalCoping;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getCreatedById() {
        return createdById;
    }

    public void setCreatedById(String createdById) {
        this.createdById = createdById == null ? null : createdById.trim();
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy == null ? null : createdBy.trim();
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Date getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(Date receivedDate) {
        this.receivedDate = receivedDate;
    }
}
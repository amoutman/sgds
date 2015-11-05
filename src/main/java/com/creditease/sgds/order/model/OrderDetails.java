package com.creditease.sgds.order.model;

import java.math.BigDecimal;

public class OrderDetails {
    private String id;

    private String orderId;

    private String productId;

    private Integer count;

    private Integer evaluateOrNot;

	private String productName;
    
    private String unit;
    
    private BigDecimal price;
    
    private String productMasterPic;
    
    private BigDecimal productAmount;
    
    private String productDesc;

    public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId == null ? null : productId.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getEvaluateOrNot() {
        return evaluateOrNot;
    }

    public void setEvaluateOrNot(Integer evaluateOrNot) {
        this.evaluateOrNot = evaluateOrNot;
    }
    
    public BigDecimal getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(BigDecimal productAmount) {
		this.productAmount = productAmount;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getProductMasterPic() {
		return productMasterPic;
	}

	public void setProductMasterPic(String productMasterPic) {
		this.productMasterPic = productMasterPic;
	}
}
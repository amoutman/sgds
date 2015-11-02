package com.creditease.sgds.order.model;

public class OrderDetails {
    private String id;

    private String orderId;

    private String productId;

    private Integer count;

    private Integer evaluateOrNot;

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
}
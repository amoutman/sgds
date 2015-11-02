package com.creditease.sgds.user.model;

import java.util.Date;

public class UserCoupon {
    private String id;

    private String userId;

    private String couponNo;

    private Integer amount;

    private Date expDate;

    private Integer status;

    private String descForGet;

    private String descForUsed;

    private Date getDatetime;

    private Date usedDatetime;

    private String picPath;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getCouponNo() {
        return couponNo;
    }

    public void setCouponNo(String couponNo) {
        this.couponNo = couponNo == null ? null : couponNo.trim();
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Date getExpDate() {
        return expDate;
    }

    public void setExpDate(Date expDate) {
        this.expDate = expDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDescForGet() {
        return descForGet;
    }

    public void setDescForGet(String descForGet) {
        this.descForGet = descForGet == null ? null : descForGet.trim();
    }

    public String getDescForUsed() {
        return descForUsed;
    }

    public void setDescForUsed(String descForUsed) {
        this.descForUsed = descForUsed == null ? null : descForUsed.trim();
    }

    public Date getGetDatetime() {
        return getDatetime;
    }

    public void setGetDatetime(Date getDatetime) {
        this.getDatetime = getDatetime;
    }

    public Date getUsedDatetime() {
        return usedDatetime;
    }

    public void setUsedDatetime(Date usedDatetime) {
        this.usedDatetime = usedDatetime;
    }

    public String getPicPath() {
        return picPath;
    }

    public void setPicPath(String picPath) {
        this.picPath = picPath == null ? null : picPath.trim();
    }
}
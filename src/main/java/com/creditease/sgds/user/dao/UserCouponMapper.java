package com.creditease.sgds.user.dao;

import java.util.List;
import java.util.Map;

import com.creditease.sgds.user.bean.UserCoupon;

public interface UserCouponMapper {
	
	public List<UserCoupon> getUserCouponList(Map<String,Object> ucMap);
	
	public Integer getUserCouponCount(Map<String,Object> ucMap);
}

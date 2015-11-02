package com.creditease.sgds.user.service;

import java.util.List;
import java.util.Map;

import com.creditease.sgds.user.model.UserCoupon;


public interface UserCouponService {
	
	public List<UserCoupon> getUserCouponList(Map<String,Object> ucMap);
	
	public Integer getUserCouponCount(Map<String,Object> ucMap);
}

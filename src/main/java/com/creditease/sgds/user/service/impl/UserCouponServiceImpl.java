package com.creditease.sgds.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creditease.sgds.user.dao.UserCouponMapper;
import com.creditease.sgds.user.model.UserCoupon;
import com.creditease.sgds.user.service.UserCouponService;

@Service("userCouponService")
public class UserCouponServiceImpl implements UserCouponService {

	private UserCouponMapper userCouponMapper;
	
	@Autowired
	public void setUserCouponService(UserCouponMapper userCouponMapper) {
		this.userCouponMapper = userCouponMapper;
	}

	@Override
	public List<UserCoupon> getUserCouponList(Map<String, Object> ucMap) {
		// TODO Auto-generated method stub
		return userCouponMapper.getUserCouponList(ucMap);
	}

	@Override
	public Integer getUserCouponCount(Map<String, Object> ucMap) {
		// TODO Auto-generated method stub
		return userCouponMapper.getUserCouponCount(ucMap);
	}

}

package com.creditease.sgds.user.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creditease.sgds.user.dao.ReceiverMapper;
import com.creditease.sgds.user.dao.UserCouponMapper;
import com.creditease.sgds.user.dao.UserMapper;
import com.creditease.sgds.user.model.Receiver;
import com.creditease.sgds.user.model.User;
import com.creditease.sgds.user.model.UserCoupon;
import com.creditease.sgds.user.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	private ReceiverMapper receiverMapper;
	
	public ReceiverMapper getReceiverMapper() {
		return receiverMapper;
	}

	@Autowired
	public void setReceiverMapper(ReceiverMapper receiverMapper) {
		this.receiverMapper = receiverMapper;
	}
	
	private UserCouponMapper userCouponMapper;
	
	public UserCouponMapper getUserCouponMapper() {
		return userCouponMapper;
	}

	@Autowired
	public void setUserCouponMapper(UserCouponMapper userCouponMapper) {
		this.userCouponMapper = userCouponMapper;
	}
	
	private UserMapper userMapper;

	public UserMapper getUserMapper() {
		return userMapper;
	}

	@Autowired
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public Receiver selectDefReceiverByUserId(String userId) {
		return receiverMapper.selectDefReceiverByUserId(userId);
	}

	@Override
	public List<UserCoupon> selectCouponsByUserId(String userId, Integer status, BigDecimal orderAmount) {
		return userCouponMapper.selectCouponsByUserId(userId, status, orderAmount);
	}

	@Override
	public UserCoupon getUserCouponById(String couponId) throws Exception {
		return userCouponMapper.selectByPrimaryKey(couponId);
	}

	@Override
	public User getUserByUserName(String userName) throws Exception {
		return userMapper.selectByUserName(userName);
	}

	@Override
	public User checkUser(String userName, String passWord) throws Exception {
		User user = userMapper.selectByUserName(userName);
		if(user != null && passWord.equals(user.getPassword())){
			return user;
		}
		return null;
	}

	@Override
	public List<Receiver> selectReceiversByUserId(String userId) throws Exception {
		return receiverMapper.getReceiverListByUserId(userId);
	}

	@Override
	public Receiver selectReceiverById(String id) throws Exception {
		return receiverMapper.getReceiverById(id);
	}

	@Override
	public void updateReceiverById(Receiver receiver) throws Exception {
		receiverMapper.updateReceiver(receiver);
	}

	@Override
	public void saveUser(User user) throws Exception {
		userMapper.insertSelective(user);
	}

}

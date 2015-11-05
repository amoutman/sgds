package com.creditease.sgds.user.service;

import java.math.BigDecimal;
import java.util.List;

import com.creditease.sgds.user.model.Receiver;
import com.creditease.sgds.user.model.User;
import com.creditease.sgds.user.model.UserCoupon;

public interface UserService {
	
	Receiver selectDefReceiverByUserId(String userId);
	
	Receiver selectReceiverById(String id)throws Exception;
	
	List<UserCoupon> selectCouponsByUserId(String userId, Integer status, BigDecimal orderAmount);
	
	UserCoupon getUserCouponById(String couponId)throws Exception;
	
	User getUserByUserName(String userName)throws Exception;
	
	User checkUser(String userName, String passWord)throws Exception;
	
	List<Receiver> selectReceiversByUserId(String userId)throws Exception;
	
	void updateReceiverById(Receiver receiver)throws Exception;
	
	void saveUser(User user)throws Exception;
}

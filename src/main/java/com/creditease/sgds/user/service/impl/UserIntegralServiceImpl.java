package com.creditease.sgds.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creditease.sgds.user.bean.UserIntegral;
import com.creditease.sgds.user.dao.UserIntegralMapper;
import com.creditease.sgds.user.service.UserIntegralService;

@Service("userIntegralService")
public class UserIntegralServiceImpl implements UserIntegralService {
	
	private UserIntegralMapper userIntegralMapper;

	@Autowired
	public void setUserIntegralMapper(UserIntegralMapper userIntegralMapper) {
		this.userIntegralMapper = userIntegralMapper;
	}

	@Override
	public List<UserIntegral> getUserIntegralList(String userId) {
		// TODO Auto-generated method stub
		return userIntegralMapper.getUserIntegralList(userId);
	}

	@Override
	public Integer getUserIntegralSum(String userId) {
		// TODO Auto-generated method stub
		return userIntegralMapper.getUserIntegralSum(userId);
	}

}

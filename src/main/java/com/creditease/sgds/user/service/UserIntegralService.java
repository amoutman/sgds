package com.creditease.sgds.user.service;

import java.util.List;

import com.creditease.sgds.user.model.UserIntegral;


public interface UserIntegralService {
	public List<UserIntegral> getUserIntegralList(String userId);
	
	public Integer getUserIntegralSum(String userId);
}

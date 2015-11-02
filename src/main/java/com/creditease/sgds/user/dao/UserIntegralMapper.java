package com.creditease.sgds.user.dao;

import java.util.List;

import com.creditease.sgds.user.bean.UserIntegral;

public interface UserIntegralMapper {
	public List<UserIntegral> getUserIntegralList(String userId);
	
	public Integer getUserIntegralSum(String userId);
}

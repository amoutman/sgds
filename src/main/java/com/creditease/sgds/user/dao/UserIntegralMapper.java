package com.creditease.sgds.user.dao;

import java.util.List;

import com.creditease.sgds.user.model.UserIntegral;

public interface UserIntegralMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserIntegral record);

    int insertSelective(UserIntegral record);

    UserIntegral selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserIntegral record);

    int updateByPrimaryKey(UserIntegral record);
    
	public List<UserIntegral> getUserIntegralList(String userId);
	
	public Integer getUserIntegralSum(String userId);
}

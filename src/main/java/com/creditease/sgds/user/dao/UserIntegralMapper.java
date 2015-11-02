package com.creditease.sgds.user.dao;

import com.creditease.sgds.user.model.UserIntegral;

public interface UserIntegralMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserIntegral record);

    int insertSelective(UserIntegral record);

    UserIntegral selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserIntegral record);

    int updateByPrimaryKey(UserIntegral record);
}
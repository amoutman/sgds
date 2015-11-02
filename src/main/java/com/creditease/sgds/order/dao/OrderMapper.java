package com.creditease.sgds.order.dao;

import com.creditease.sgds.order.model.Order;

public interface OrderMapper {
	
    int deleteByPrimaryKey(String id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
}
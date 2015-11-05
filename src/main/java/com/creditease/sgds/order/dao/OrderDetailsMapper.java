package com.creditease.sgds.order.dao;

import java.util.List;
import java.util.Map;

import com.creditease.sgds.order.model.OrderDetails;

public interface OrderDetailsMapper {
    int deleteByPrimaryKey(String id);

    int insert(OrderDetails record);

    int insertSelective(OrderDetails record);

    OrderDetails selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(OrderDetails record);

    int updateByPrimaryKey(OrderDetails record);
    
    List<OrderDetails> getOrderDetailsListByOrderId(String orderId);
    
    int getUnEvaluatedCount(Map<String,Object> uMap);
    
    List<OrderDetails> getUnEvaluatedList(Map<String,Object> uMap);
    
    OrderDetails getOrderDetailsById(String id);
}
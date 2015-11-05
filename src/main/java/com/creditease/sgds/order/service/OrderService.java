package com.creditease.sgds.order.service;

import java.util.List;
import java.util.Map;

import com.creditease.sgds.order.model.Order;
import com.creditease.sgds.order.model.OrderDetails;

public interface OrderService {
	
	public void saveOrder(Order order) throws Exception;
	
	public void saveOrderDetails(OrderDetails orderDetails) throws Exception;
	
	public Order getOrderById(String orderId) throws Exception;
	
	public void updateOrderById(Order order) throws Exception;
	
	public Order selectByPrimaryKey(String id);
	
    public List<Order> getOrderListByParams(Map<String,Object> paramMap);
    
    public int getOrderCountByParams(Map<String,Object> paramMap);
    
    public List<OrderDetails> getOrderDetailsListByOrderId(String orderId);
    
    public int getUnEvaluatedCount(Map<String,Object> uMap);
    
    public List<OrderDetails> getUnEvaluatedList(Map<String,Object> uMap);
    
    public OrderDetails getOrderDetailsById(String id);
    
    public void updateOrderReviewStatus(OrderDetails orderDetails);
    
    public void updateByPrimaryKeySelective(Order record);

}

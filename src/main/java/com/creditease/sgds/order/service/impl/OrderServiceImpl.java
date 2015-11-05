package com.creditease.sgds.order.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creditease.sgds.order.dao.OrderDetailsMapper;
import com.creditease.sgds.order.dao.OrderMapper;
import com.creditease.sgds.order.model.Order;
import com.creditease.sgds.order.model.OrderDetails;
import com.creditease.sgds.order.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	private OrderMapper orderMapper;

	public OrderMapper getOrderMapper() {
		return orderMapper;
	}
	
	@Autowired
	public void setOrderMapper(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}
	
	private OrderDetailsMapper orderDetailsMapper;

	public OrderDetailsMapper getOrderDetailsMapper() {
		return orderDetailsMapper;
	}

	@Autowired
	public void setOrderDetailsMapper(OrderDetailsMapper orderDetailsMapper) {
		this.orderDetailsMapper = orderDetailsMapper;
	}

	@Override
	public void saveOrder(Order order) throws Exception {
		orderMapper.insert(order);
	}

	@Override
	public void saveOrderDetails(OrderDetails orderDetail) throws Exception {
		orderDetailsMapper.insert(orderDetail);
	}

	@Override
	public Order getOrderById(String orderId) throws Exception {
		return orderMapper.selectByPrimaryKey(orderId);
	}

	@Override
	public void updateOrderById(Order order) throws Exception {
		orderMapper.updateByPrimaryKeySelective(order);
	}

	public Order selectByPrimaryKey(String id){
		return orderMapper.selectByPrimaryKey(id);
	}
	
	public List<Order> getOrderListByParams(Map<String,Object> paramMap){
		return orderMapper.getOrderListByParams(paramMap);
	}
	    
	public int getOrderCountByParams(Map<String,Object> paramMap){
		return orderMapper.getOrderCountByParams(paramMap);
	}
	
	public List<OrderDetails> getOrderDetailsListByOrderId(String orderId){
		return orderDetailsMapper.getOrderDetailsListByOrderId(orderId);
	}
	
    public int getUnEvaluatedCount(Map<String,Object> uMap)
    {
    	return orderDetailsMapper.getUnEvaluatedCount(uMap);
    }
    
    public List<OrderDetails> getUnEvaluatedList(Map<String,Object> uMap){
    	return orderDetailsMapper.getUnEvaluatedList(uMap);
    }
    
    public OrderDetails getOrderDetailsById(String id){
    	return orderDetailsMapper.getOrderDetailsById(id);
    }
    
    public void updateOrderReviewStatus(OrderDetails orderDetails){
    	orderDetailsMapper.updateByPrimaryKeySelective(orderDetails);
    }
    
    public void updateByPrimaryKeySelective(Order record){
    	orderMapper.updateByPrimaryKeySelective(record);
    }
}

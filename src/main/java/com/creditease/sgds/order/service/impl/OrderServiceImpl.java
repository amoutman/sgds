package com.creditease.sgds.order.service.impl;

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

}

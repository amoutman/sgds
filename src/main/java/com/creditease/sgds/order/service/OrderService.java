package com.creditease.sgds.order.service;

import com.creditease.sgds.order.model.Order;
import com.creditease.sgds.order.model.OrderDetails;

public interface OrderService {
	
	public void saveOrder(Order order) throws Exception;
	
	public void saveOrderDetails(OrderDetails orderDetails) throws Exception;
	
	public Order getOrderById(String orderId) throws Exception;
	
	public void updateOrderById(Order order) throws Exception;
	
}

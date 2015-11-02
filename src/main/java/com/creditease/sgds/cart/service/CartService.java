package com.creditease.sgds.cart.service;

import java.util.List;
import java.util.Map;

import com.creditease.sgds.cart.bean.Cart;
import com.creditease.sgds.cart.bean.CartDetails;

public interface CartService {
	
	public Cart getCartById(String id);
	
	public List<CartDetails> getCartDetailsList(Map<String,Object> cdMap);
	
	public void insertCart(Cart cart);
	
	public void deleteCart(String cartId);
	
	public void insertCartDetails(CartDetails cd);
	
	public void deleteCartDetails(String id);
	
	public List<CartDetails> getCartDetailsListByProdcutIds(String cartId, List<String> productIds);

}

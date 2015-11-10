package com.creditease.sgds.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.creditease.sgds.cart.bean.Cart;
import com.creditease.sgds.cart.bean.CartDetails;

public interface CartMapper {
	public Cart getCartById(String id);
	
	public List<CartDetails> getCartDetailsList(Map<String,Object> cdMap);
	
	public void insertCart(Cart cart);
	
	public void deleteCart(String cartId);
	
	public void updateCart(Cart cart);
	
	public void insertCartDetails(CartDetails cd);
	
	public void insertCartDetailsList(List<CartDetails> cdList);
	
	public void deleteCartDetails(String id);
	
	public List<CartDetails> getCartDetailsListByProdcutIds(@Param("cartId")String cartId, @Param("productIds")List<String> productIds);

	public void deleteCartDetailsList(List<String> ids);
	
	public void updateCartDetails(CartDetails cd);
	
	public CartDetails getCartDetailsByProdcutId(Map<String,Object> cdMap);
}

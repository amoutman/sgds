package com.creditease.sgds.cart.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creditease.sgds.cart.bean.Cart;
import com.creditease.sgds.cart.bean.CartDetails;
import com.creditease.sgds.cart.dao.CartMapper;
import com.creditease.sgds.cart.service.CartService;

@Service("cartService")
public class CartServiceImpl implements CartService {

	private CartMapper cartMapper;
	
	@Autowired
	public void setCartMapper(CartMapper cartMapper) {
		this.cartMapper = cartMapper;
	}

	@Override
	public Cart getCartById(String id) {
		// TODO Auto-generated method stub
		return cartMapper.getCartById(id);
	}

	@Override
	public List<CartDetails> getCartDetailsList(Map<String, Object> cdMap) {
		// TODO Auto-generated method stub
		return cartMapper.getCartDetailsList(cdMap);
	}

	@Override
	public void insertCart(Cart cart) {
		// TODO Auto-generated method stub
		cartMapper.insertCart(cart);
	}

	@Override
	public void deleteCart(String cartId) {
		// TODO Auto-generated method stub
		cartMapper.deleteCart(cartId);
	}
	
	public void updateCart(Cart cart){
		cartMapper.updateCart(cart);
	}

	@Override
	public void insertCartDetails(CartDetails cd) {
		// TODO Auto-generated method stub
		cartMapper.insertCartDetails(cd);
	}
	
	public void insertCartDetailsList(List<CartDetails> cdList){
		cartMapper.insertCartDetailsList(cdList);
	}

	@Override
	public void deleteCartDetails(String id) {
		// TODO Auto-generated method stub
		cartMapper.deleteCartDetails(id);
	}
	
	public void deleteCartDetailsList(List<String> ids){
		cartMapper.deleteCartDetailsList(ids);
	}
	
	public void updateCartDetails(CartDetails cd){
		cartMapper.updateCartDetails(cd);
	}

}

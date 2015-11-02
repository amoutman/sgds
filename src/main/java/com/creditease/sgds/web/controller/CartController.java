package com.creditease.sgds.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.creditease.sgds.cart.bean.Cart;
import com.creditease.sgds.cart.bean.CartDetails;
import com.creditease.sgds.cart.service.CartService;

@RequestMapping("/cart")
@Controller
public class CartController {
	
	@Resource(name="cartService")
	private CartService cartService;
	
	@RequestMapping("/toCart")
	public ModelAndView toCart(HttpServletRequest request, @RequestParam("userId") String userId){
		ModelAndView mv = new ModelAndView();
		Cart cart = cartService.getCartById(userId);
		if(!cart.equals(null)){
			Map<String,Object> cdMap = new HashMap<String,Object>();
			cdMap.put("cartId", cart.getId());
			List<CartDetails> cdList = cartService.getCartDetailsList(cdMap);
			cart.setCdList(cdList);
		}
		mv.addObject("cart", cart);
		mv.setViewName("cart/cart");
		return mv;
	}
	
	public void addProductToCart(HttpServletRequest request,HttpServletResponse response, @RequestParam("productId") String productId){
		Cookie cookie = getCookieByName(request,"productId");
		Cookie newCookie = null;
		if(cookie.equals(null)){
			newCookie = new Cookie("productId",productId);
		}else{
			String productIds = cookie.getValue();
			StringBuffer sb = new StringBuffer(productIds);
			sb.append(",");
			sb.append(productId);
			String newProductIds = sb.toString();
			newCookie = new Cookie("productId",newProductIds);
		}
		newCookie.setMaxAge(3600);
		response.addCookie(newCookie);
	}
	
	public static Cookie getCookieByName(HttpServletRequest request,String name){
	    Map<String,Cookie> cookieMap = ReadCookieMap(request);

	    if(cookieMap.containsKey(name)){
	        Cookie cookie = (Cookie)cookieMap.get(name);
	        return cookie;
	    }else{
	        return null;
	    }   
	}
	
	private static Map<String,Cookie> ReadCookieMap(HttpServletRequest request){  
	    Map<String,Cookie> cookieMap = new HashMap<String,Cookie>();

	    Cookie[] cookies = request.getCookies();
	    if(null!=cookies){
	        for(Cookie cookie : cookies){
	            cookieMap.put(cookie.getName(), cookie);
	        }
	    }
	    return cookieMap;
	}
	
}

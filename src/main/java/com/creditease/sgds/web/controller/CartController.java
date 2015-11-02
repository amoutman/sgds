package com.creditease.sgds.web.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
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
import com.creditease.sgds.product.bean.Product;
import com.creditease.sgds.product.service.ProductService;
import com.creditease.sgds.user.bean.User;
import com.creditease.sgds.util.PKIDUtils;

@RequestMapping("/cart")
@Controller
public class CartController {
	@Resource
	private CartService cartService;
	@Resource
	private ProductService productService;
	
	@RequestMapping("/toCart")
	public ModelAndView toCart(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
/*		Cart cart = cartService.getCartById(userId);
		if(!cart.equals(null)){
			Map<String,Object> cdMap = new HashMap<String,Object>();
			cdMap.put("cartId", cart.getId());
			List<CartDetails> cdList = cartService.getCartDetailsList(cdMap);
			cart.setCdList(cdList);
		}*/
		User user = (User)request.getSession().getAttribute("user");
		Cart cart = null;
		if(!user.equals(null)){
			cart = cartService.getCartById(user.getId());
			cart.setUpdatedDate(new Date());
			//查询默认收货地址
			
		}else{
			cart = new Cart();
		}
		
		Cookie cookie = getCookieByName(request,"productId");
		//Cookie numCookie = getCookieByName(request,productId);
		if(cookie.equals(null)){
			String msg = "您的购物车还没有任何商品哦，马上去购物吧！";
			mv.addObject("msg", msg);
		}else{
			//根据Cookie中的productId查询出商品详细列表
			String productIds = cookie.getValue();
			//String[] pdStr = productIds.split(",");
			List<String> pdList = strArrayToList(productIds);
			//for(int i=0;i<productIds.length();i++){
				//pdList.add(pdStr[i]);
			//}
			
			List<Product> productList = productService.getProductDetailsByIds(pdList);
			
			BigDecimal settleAmount = new BigDecimal(0);
			CartDetails cd = null;
			List<CartDetails> cdList = new ArrayList<CartDetails>();
			if(cart.getCdList().size()>0){
				cdList.addAll(cart.getCdList());
			}
			
			if(productList.size()>0){
				for(Product p:productList){
					cd = new CartDetails();
					//获取cookie中每个商品的数量
					Cookie numCookie = getCookieByName(request,p.getId());
					int count = Integer.parseInt(numCookie.getValue());
					
					cd.setId(PKIDUtils.getUuid());
					cd.setShoppingCartId(cart.getId());
					cd.setProductId(p.getId());
					cd.setProductName(p.getProductName());
					cd.setProductMasterPic(p.getProductDetailsMasterPicPath());
					cd.setUnit(p.getUnit());
					cd.setPrice(p.getPrice());
					cd.setCount(count);
					BigDecimal pAmount = new BigDecimal(0);
					pAmount = p.getPrice().multiply(new BigDecimal(count)); 
					settleAmount = settleAmount.add(pAmount);
					cdList.add(cd);
				}
				cart.setSettleAmount(settleAmount);
				cart.setCdList(cdList);
			}
			if(!user.equals(null)){
				//将购物车数据插入数据库
				cartService.updateCart(cart);
				cartService.insertCartDetailsList(cdList);
			}
			
			mv.addObject("cart", cart);
		}
		mv.setViewName("cart/cart");
		return mv;
	}
	
	@RequestMapping("/toAddProductToCart")
	public void addProductToCart(HttpServletRequest request,HttpServletResponse response, @RequestParam("productId") String productId){
		Cookie cookie = getCookieByName(request,"productId");
		Cookie numCookie = getCookieByName(request,productId);
		Cookie newCookie = null;
		Cookie newNumCookie = null;
		if(cookie.equals(null)){
			newCookie = new Cookie("productId",productId);
			newNumCookie = new Cookie(productId,"1");
		}else{
			if(numCookie.equals(null)){
				String productIds = cookie.getValue();
				StringBuffer sb = new StringBuffer(productIds);
				sb.append(",");
				sb.append(productId);
				String newProductIds = sb.toString();
				newCookie = new Cookie("productId",newProductIds);
				newNumCookie = new Cookie(productId,"1");
			}else{
				String pNum = numCookie.getValue();
				int num = Integer.parseInt(pNum);
				int newNum = num + 1;
				newNumCookie = new Cookie(productId,String.valueOf(newNum));
			}
		}
		newCookie.setMaxAge(3600);
		newNumCookie.setMaxAge(3600);
		response.addCookie(newCookie);
		response.addCookie(newNumCookie);
	}
	
	@RequestMapping("/deleteProductFromCart")
	public void deleteProductFromCart(HttpServletRequest request,HttpServletResponse response, @RequestParam("cdIds") String cdIds,@RequestParam("productIds") String productIds){
		User user = (User)request.getSession().getAttribute("user");
		List<String> cdList = strArrayToList(cdIds);
		List<String> pdIdList = strArrayToList(productIds);
		if(!user.equals(null)){
			cartService.deleteCartDetailsList(cdList);
		}
		Cookie cookie = getCookieByName(request,"productId");
		Cookie newCookie = null;
		if(!cookie.equals(null)){
			String cProductIds = cookie.getValue();
			if(cProductIds.length()>productIds.length()){
				String newPIds = cProductIds;
				for(int i=0;i<pdIdList.size();i++){
					StringBuffer sb = new StringBuffer(newPIds);
					int idIndex = newPIds.indexOf(pdIdList.get(i));
					if(idIndex == 0){
						sb.delete(0, pdIdList.get(i).length()-1);
					}else if(idIndex > 0){
						sb.delete(idIndex-1, pdIdList.get(i).length());
					}
					newPIds = sb.toString();
				}	
				newCookie = new Cookie("productId",newPIds);
				newCookie.setMaxAge(3600);
			}else{
				newCookie = new Cookie("productId",null);
				newCookie.setMaxAge(0);
			}
			Cookie numCookie = null;
			for(int i=0;i<pdIdList.size();i++){
				numCookie = new Cookie(pdIdList.get(i),null);
				numCookie.setMaxAge(0);
				response.addCookie(numCookie);
			}
			response.addCookie(newCookie);
		}
		
	}
	
	@RequestMapping("/calProductCount")
	public void calProductCount(HttpServletRequest request,HttpServletResponse response, @RequestParam("type") String type,@RequestParam("cdId") String cdId,
			@RequestParam("productId") String productId,@RequestParam("count") String count){
		User user = (User)request.getSession().getAttribute("user");

		Cookie cookie = getCookieByName(request,productId);
		String numS = cookie.getValue();
		
		int newNum = Integer.parseInt(numS);
		if(type.equals("add")){
			newNum = newNum + 1;
		}else{
			newNum = newNum - 1;
		}
		
		Cookie numCookie = new Cookie(productId,String.valueOf(newNum));
		numCookie.setMaxAge(3600);
		
		if(!user.equals(null)){
			CartDetails cd = new CartDetails();
			cd.setId(cdId);
			cd.setCount(newNum);
			cartService.updateCartDetails(cd);
		}
		
		response.addCookie(numCookie);
		
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
	
	private static List<String> strArrayToList(String str){
		String[] strArray = str.split(",");
		List<String> sList = new ArrayList<String>();
		for(String s:strArray){
			sList.add(s);
		}
		return sList;
	}
	
}

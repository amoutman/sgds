package com.creditease.sgds.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.creditease.sgds.cart.bean.Cart;
import com.creditease.sgds.cart.service.CartService;
import com.creditease.sgds.user.model.User;
import com.creditease.sgds.user.service.UserService;
import com.creditease.sgds.util.BusConstants;
import com.creditease.sgds.util.GlobalPara;
import com.creditease.sgds.util.MD5;
import com.creditease.sgds.util.PKIDUtils;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="cartService")
	private CartService cartService;
	
	/**跳转至登录界面 - 并初始化一些等下相关的资源*/
	@RequestMapping(value="/prepareLogin", method=RequestMethod.GET)
	public ModelAndView prepareLogin(HttpServletRequest request){
		ModelAndView view = new ModelAndView();
		view.setViewName("login/login");
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public Object login(HttpServletRequest request){
		
		String result = "";
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
		
		try {
			Map<String,String> map = new HashMap<String,String>();  
			map.put(GlobalPara.AJAX_KEY,GlobalPara.AJAX_FALSE);
			if(StringUtils.isBlank(userName)){
				result = "账号不能为空！";
			}
			
			if(StringUtils.isBlank(passWord)){
				result = "密码不能为空！";
			}
			
			if(StringUtils.isBlank(result)){
				User user = userService.checkUser(userName.trim(), MD5.md5(passWord.trim()));
				if(user != null){
					map.put(GlobalPara.AJAX_KEY,GlobalPara.AJAX_SUCCESS);
					request.getSession().setAttribute(GlobalPara.USER_SESSION_TOKEN, user);
					//更新用户最后登录时间
					
				}else{
					result = "账号与密码不匹配！";
				}
			}
	        
	        map.put("result", result);
	        return map;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String,String> map = new HashMap<String,String>();
			map.put(GlobalPara.AJAX_KEY,GlobalPara.AJAX_FALSE);
			map.put("result", "系统登录出错，请重试！");
			return map;
		}
	}
	
	@RequestMapping(value="/prepareRegist", method=RequestMethod.GET)
	public ModelAndView prepareRegist(HttpServletRequest request){
		ModelAndView view = new ModelAndView();
		view.setViewName("login/regist");
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public Object regist(@ModelAttribute("user")User user, @RequestParam("verCodeToken")String verCodeToken){
		String result = "";
		try {
			Map<String,String> map = new HashMap<String,String>(); 
			map.put(GlobalPara.AJAX_KEY,GlobalPara.AJAX_FALSE);
			if(StringUtils.isBlank(user.getMobile().trim())){
				result = "手机号不能为空！";
			}
			if(StringUtils.isBlank(user.getPassword().trim())){
				result = "密码不能为空！";
			}
			
			//TODO 手机校验码校验
			
			if(StringUtils.isBlank(result)){
				//保存用户信息
				user.setId(PKIDUtils.getUuid());
				user.setStatus(BusConstants.USER_STATUS_YES);
				user.setUserType(BusConstants.USER_TYPE_ORDINARY);
				user.setPassword(MD5.md5(user.getPassword().trim()));
				user.setMobile(user.getMobile().trim());
				user.setCreatedDate(new Date());
				user.setUpdatedDate(new Date());
				userService.saveUser(user);
				//保存用户购物车信息
				Cart cart = new Cart();
				cart.setId(PKIDUtils.getUuid());
				cart.setUserId(user.getId());
				cart.setCreatedDate(new Date());
				cart.setUpdatedDate(new Date());
				cartService.insertCart(cart);
				map.put(GlobalPara.AJAX_KEY,GlobalPara.AJAX_SUCCESS);
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String,String> map = new HashMap<String,String>(); 
			map.put(GlobalPara.AJAX_KEY,GlobalPara.AJAX_FALSE);
			map.put("result", "用户注册失败，请重试！");
			return map;
		}
	}
	
	/**
	 * 获取验证码
	 */
	@RequestMapping(value = "getVerifyCode")
	@ResponseBody
	public Object getVerifyCode(String phone, HttpServletResponse response)  {
		ModelAndView view = new ModelAndView();
		view.addObject("verCode", "9999");
		return view;
	}
	
	public static void main(String[] args) {
		System.out.println(MD5.md5("123456"));
	}
}

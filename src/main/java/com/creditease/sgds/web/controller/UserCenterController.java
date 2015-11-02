package com.creditease.sgds.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.creditease.sgds.user.model.User;
import com.creditease.sgds.user.model.UserCoupon;
import com.creditease.sgds.user.model.UserIntegral;
import com.creditease.sgds.user.service.UserCouponService;
import com.creditease.sgds.user.service.UserIntegralService;

@RequestMapping("/userCenter")
@Controller
public class UserCenterController {
	@Resource
	private UserCouponService userCouponService;
	
	@Resource
	private UserIntegralService userIntegralService;
	
	@RequestMapping("/toUserCenter")
	public ModelAndView toUserCenter(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute("user");
		Map<String,Object> ucMap = new HashMap<String,Object>();
		ucMap.put("userId", user.getId());
		ucMap.put("status", 0);
		Integer couponCount = userCouponService.getUserCouponCount(ucMap);
		mv.addObject("couponCount", couponCount);
		Integer integral = userIntegralService.getUserIntegralSum(user.getId());
		mv.addObject("integral", integral);
		mv.addObject("user", user);
		mv.setViewName("user/userCenter");
		return mv;
	}
	
	@RequestMapping("/toUserCoupon")
	public ModelAndView toUserCoupon(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute("user");
		Map<String,Object> ucMap = new HashMap<String,Object>();
		ucMap.put("userId", user.getId());
		ucMap.put("status", 0);
		List<UserCoupon> ucList = userCouponService.getUserCouponList(ucMap);
		mv.addObject("ucList", ucList);
		mv.setViewName("user/userCoupon");
		return mv;
	}
	
	@RequestMapping("/toUserIntegral")
	public ModelAndView toUserIntegral(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		User user = (User)request.getSession().getAttribute("user");
		Integer integral = userIntegralService.getUserIntegralSum(user.getId());
		List<UserIntegral> uiList = userIntegralService.getUserIntegralList(user.getId());
		mv.addObject("integral", integral);
		mv.addObject("uiList", uiList);
		mv.setViewName("user/userIntegral");
		return mv;
	}
}

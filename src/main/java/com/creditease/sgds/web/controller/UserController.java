package com.creditease.sgds.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.creditease.sgds.user.model.User;
import com.creditease.sgds.user.service.UserService;
import com.creditease.sgds.util.GlobalPara;

public class UserController extends BaseController{
	
	@Resource(name="userService")
	private UserService userService;
	
	/**跳转至登录界面 - 并初始化一些等下相关的资源*/
	@RequestMapping(value="/prepareLogin", method=RequestMethod.GET)
	public ModelAndView prepareLogin(HttpServletRequest request){
		ModelAndView view = new ModelAndView();
		view.setViewName(this.getResourcePath()+"/login");
		return view;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request){
		
		String result = "";
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
		
		try {
			ModelAndView view = new ModelAndView();
			
			if(StringUtils.isBlank(userName)){
				result = "账号不能为空！";
			}
			
			if(StringUtils.isBlank(passWord)){
				result = "密码不能为空！";
			}
			
			if(StringUtils.isBlank(result)){
				User user = userService.checkUser(userName, passWord);
				if(user != null){
					request.getSession().setAttribute(GlobalPara.USER_SESSION_TOKEN, user);
					return new ModelAndView("redirect:/toIndexPage");
				}else{
					result = "账号与密码不匹配！";
				}
			}
			
			view.setViewName(this.getResourcePath()+"/login");
			view.addObject("result", result);
			return view;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("账号登录出错，请重试！");
		}
	}
	
	
}

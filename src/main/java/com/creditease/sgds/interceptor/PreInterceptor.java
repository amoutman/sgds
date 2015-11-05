package com.creditease.sgds.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.creditease.sgds.user.model.User;
import com.creditease.sgds.util.GlobalPara;

public class PreInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
//		User user = (User) request.getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
//		if(user == null){
//			
//		}
		return super.preHandle(request, response, handler);
	}
	
}

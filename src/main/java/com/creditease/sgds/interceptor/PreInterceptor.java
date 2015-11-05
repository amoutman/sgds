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
		String url = request.getRequestURL().toString();
		if (url.matches(".*toUserCenter.*")) {
			User user = (User) request.getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
			if (user == null) {
				String backUrl = request.getRequestURI();
				request.getSession().setAttribute("backUrl", backUrl);
				request.getRequestDispatcher("/WEB-INF/jsp/login/login.jsp").forward(request, response);
				return false;
			}
		}
		return super.preHandle(request, response, handler);
	}
	
}

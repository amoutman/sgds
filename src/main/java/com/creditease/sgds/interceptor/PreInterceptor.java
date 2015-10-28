package com.creditease.sgds.interceptor;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PreInterceptor extends HandlerInterceptorAdapter {

	private String mappingUrl;

	// private String page;
	// private String showCount;

	// public void setPage(String page) {
	// this.page = page;
	// }
	//
	// public void setShowCount(String showCount) {
	// this.showCount = showCount;
	// }

	public void setMappingUrl(String mappingUrl) {
		this.mappingUrl = mappingUrl;
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		return true;

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv) throws Exception {
		// TODO Auto-generated method stub
	}

}

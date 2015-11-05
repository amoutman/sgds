package com.creditease.sgds.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;


@Controller
public class BaseController {
	
	/********************************************************************基本设置*********************************************************************/
	private static final Logger log = Logger.getLogger(BaseController.class);
	
	
	/**获取当前模块视图资源路径*/
	public String getResourcePath(){
		return "/"+this.getClass().getPackage().getName()
					.replaceAll("\\.controller$","").replace(".","/");
	}
	
	/**获取当前模块实体类名(简单类名)*/
	public String getModelClassSimpleName() {
		return  this.getClass().getSimpleName()
					.replaceAll("Controller$", "");
	}
	
	/**获取当前模块实体包名称(类路径名)*/
	public String getModelPackageName(){
		return this.getClass().getPackage().getName()
					.replaceAll("\\.controller$","")+".model";
	}
	
	/**获取当前模块实体类名(全类名)*/
	public String getModelClassName() {
		return this.getModelPackageName()+"."+
					this.getModelClassSimpleName();
	}
	
	/**将java对象转化为json对象*/
	public Object transformObjToJSON(Object obj){
		Object result = null;
		if(result instanceof List){
			result = JSONArray.toJSON(obj);
		}else{
			result = JSONObject.toJSON(obj);
		}
		return result;
	}
	
	/**
	 * 将一个java对象写出到response对象 
	 * true - 写出成功
	 * false - 写出失败 * */
	public Boolean writeStrToResonse(HttpServletResponse response,String info){
		Boolean result = true;
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = null;
		try{
			writer = response.getWriter();
			writer.print(info);
			writer.flush();
			return result;
		}catch(IOException e){
			e.printStackTrace();
			result = false;
			return result;
		}finally{
			writer.close();
		}
	}
	
	/**
	 * 导航至主操作页面
	 * */
	public ModelAndView index(){
		try{
			String viewName = this.getResourcePath()+"/index";
			ModelAndView view = new ModelAndView(viewName);
			return view;			
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("导航失败!");
		}
	}
	
	/**
	 * 快速获取当前线程关联的request
	 * */
	public HttpServletRequest getRequest(){
		HttpServletRequest request = ((ServletRequestAttributes)
				RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}
	
}

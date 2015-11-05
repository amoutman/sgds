package com.creditease.sgds.util;

/**
 * 系统级静态变量管理类 
 * */
public class GlobalPara {

	/**日志记录控制符*/
	public static final String LOG_FIX = " ==================== ";
	
	/**
	 * 向HttpSession中放置用户信息时的key,不许别的操作再使用这个
	 * 值向HttpSession中保存数据,以免冲掉HttpSession中的用户信息数据。
	 * */
	public static final String USER_SESSION_TOKEN = "userSessionToken";
	
	public static final String SPLIT = ",";
}

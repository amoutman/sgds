package com.creditease.sgds.util;

/**
 * 业务常量类
 */
public class BusConstants {

	/**代金券状态 0：未使用   1：已使用  2：已冻结*/
	public static final Integer USER_COUPON_STATUS_NOT_USED = 0;
	public static final Integer USER_COUPON_STATUS_USED = 1;
	public static final Integer USER_COUPON_STATUS_FROZEN = 2;
	
	/**支付状态 0：待支付  1：已支付待发货  2：货物运输中 3：已完成 4：已作废*/
	public static final Integer ORDER_PAY_STATUS_NOTPAY = 0;
	public static final Integer ORDER_PAY_STATUS_PAYNOSEND = 1;
	public static final Integer ORDER_PAY_STATUS_SENDING = 2;
	public static final Integer ORDER_PAY_STATUS_COMPLETED = 3;
	public static final Integer ORDER_PAY_STATUS_CANCELLED = 4;
	
	/**支付方式  0：微信    1：支付宝  2: 货到付款  （默认微信）*/
	public static final Integer ORDER_PAY_MODE_WECHAT = 0;
	public static final Integer ORDER_PAY_MODE_ALIPAY = 1;
	public static final Integer ORDER_PAY_MODE_CASHONDELIVERY = 2;
	
	/**评价状态 0：未评价   1：已评价*/
	public static final Integer ORDER_EVALUATION_STATUS_NO = 0;
	public static final Integer ORDER_EVALUATION_STATUS_YES = 1;
	
	/**是否为默认收货人 0:默认*/
	public static final Integer RECEIVER_ISNOT_DEFAULT_YES = 0;
	public static final Integer RECEIVER_ISNOT_DEFAULT_NO = 1;
	
	/**订单配送方式  0：送货上门  1：自取*/
	public static final Integer ORDER_DISTRIBUTION_MODE_DELIVERY = 0;
	public static final Integer ORDER_DISTRIBUTION_MODE_PICKUP = 1;
	
	/**用户状态 0：启用   1：停用*/
	public static final Integer USER_STATUS_YES = 0;
	public static final Integer USER_STATUS_NO = 1;
	
	/**用户类型 0：普通用户 1：会员 2：VIP会员*/
	public static final Integer USER_TYPE_ORDINARY = 0;
	public static final Integer USER_TYPE_MEMBER  = 1;
	public static final Integer USER_TYPE_VIPMEMBER  = 2;

}

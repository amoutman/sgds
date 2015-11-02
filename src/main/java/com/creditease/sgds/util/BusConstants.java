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
	
	/**评价状态 0：未评价   1：已评价*/
	public static final Integer ORDER_EVALUATION_STATUS_NO = 0;
	public static final Integer ORDER_EVALUATION_STATUS_YES = 1;
	
	/**是否为默认收货人 0:默认*/
	public static final Integer RECEIVER_ISNOT_DEFAULT_YES = 0;
	public static final Integer RECEIVER_ISNOT_DEFAULT_NO = 1;

}

package com.creditease.sgds.web.controller;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.creditease.sgds.cart.bean.Cart;
import com.creditease.sgds.cart.bean.CartDetails;
import com.creditease.sgds.cart.service.CartService;
import com.creditease.sgds.order.model.Order;
import com.creditease.sgds.order.model.OrderDetails;
import com.creditease.sgds.order.service.OrderService;
import com.creditease.sgds.product.service.ProductService;
import com.creditease.sgds.user.model.Receiver;
import com.creditease.sgds.user.model.User;
import com.creditease.sgds.user.model.UserCoupon;
import com.creditease.sgds.user.service.UserService;
import com.creditease.sgds.util.BigDecimalUtils;
import com.creditease.sgds.util.BusConstants;
import com.creditease.sgds.util.DateUtil;
import com.creditease.sgds.util.GlobalPara;
import com.creditease.sgds.util.PKIDUtils;

@Controller
public class OrderController extends BaseController{
	
	@Resource(name="productService")
	private ProductService productService;
	
	@Resource(name="cartService")
	private CartService cartService;
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	/**
	 * 订单确认
	 * @param productIds
	 * @return
	 */
	@RequestMapping(value = "/orderConfirm",  method = RequestMethod.POST)
	public ModelAndView orderConfirm(String productIds) {
		try {
			//获取用户信息
			User user = (User) this.getRequest().getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
			//初始化视图
			String viewName = this.getResourcePath()+"/orderConfirm";
			ModelAndView view = new ModelAndView(viewName);
			//根据session中的用户ID查询用户地址信息
			Receiver receiver = userService.selectDefReceiverByUserId(user.getId());
			view.addObject("receiver", receiver);
			//转换为List
			List<String> proIds = Arrays.asList(productIds.split(GlobalPara.SPLIT));
			//根据USER ID 获取购物车
			Cart cart = cartService.getCartById(user.getId());
			//根据 cardId 及 商品ID List 获取结算商品信息
			List<CartDetails> cardDetails = cartService.getCartDetailsListByProdcutIds(cart.getId(), proIds);
			view.addObject("cardDetails", cardDetails);
			//预计到达时间逻辑计算
			String expectedArrivalTime = calculateExpectedArrivalTime();
			view.addObject("expectedArrivalTime", expectedArrivalTime);
			//应付总金额计算
			Double totalAmount = 0.0;
			for (CartDetails cartDetail : cardDetails) {
				totalAmount = BigDecimalUtils.add(totalAmount.doubleValue(), (cartDetail.getCount() * cartDetail.getPrice().doubleValue()));
			}
			totalAmount = BigDecimalUtils.round(totalAmount, 2);
			view.addObject("totalAmount", totalAmount);
			//根据session中的用户ID查询用户代金券信息
			List<UserCoupon> coupons = userService.selectCouponsByUserId(user.getId(), BusConstants.USER_COUPON_STATUS_NOT_USED, BigDecimal.valueOf(totalAmount));
			view.addObject("coupons", coupons);
			//保存商品字符串
			view.addObject("productIds", productIds);
			return view;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("订单确认模块处理出错!");
		}
	}
	
	@RequestMapping(value = "/changeAddrs",  method = RequestMethod.POST)
	public ModelAndView changeAddress(String productIds){
		try {
			//获取用户信息
			User user = (User) this.getRequest().getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
			//初始化视图
			String viewName = this.getResourcePath()+"/changeAddrs";
			ModelAndView view = new ModelAndView(viewName);
			view.addObject("productIds", productIds);
			view.addObject("receivers", userService.selectReceiversByUserId(user.getId()));
			return view;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("变更地址模块处理失败!");
		}
	}
	
	@RequestMapping(value = "/changeDefAddrs",  method = RequestMethod.POST)
	public ModelAndView changeDefAddress(String receiverId, String productIds){
		try {
			//获取用户信息
			User user = (User) this.getRequest().getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
			Receiver receiver = userService.selectDefReceiverByUserId(user.getId());
			//初始化视图
			String viewName = this.getResourcePath()+"/orderConfirm";
			ModelAndView view = new ModelAndView(viewName);
			view.addObject("productIds", productIds);
			if(!receiverId.equals(receiver.getId())){
				//更新当前默认地址状态
				receiver.setMasterOrNot(BusConstants.RECEIVER_ISNOT_DEFAULT_NO);
				userService.updateReceiverById(receiver);
				//获取并更新新的默认地址
				receiver = userService.selectReceiverById(receiverId);
				receiver.setMasterOrNot(BusConstants.RECEIVER_ISNOT_DEFAULT_YES);
				userService.updateReceiverById(receiver);
			}

			return view;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("变更地址模块处理失败!");
		}
	}
	
	@RequestMapping(value = "/createAddr",  method = RequestMethod.POST)
	public ModelAndView createAddress(String productIds){
		return null;
	}
	
	@RequestMapping(value = "/orderCommit",  method = RequestMethod.POST)
	public ModelAndView orderCommit(Order order) {
		try {
			//获取用户信息
			User user = (User) this.getRequest().getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
			//转换为List
			List<String> proIds = Arrays.asList(order.getProductIds().split(GlobalPara.SPLIT));
			//根据USER ID 获取购物车
			Cart cart = cartService.getCartById(user.getId());
			//根据 cardId 及 商品ID List 获取结算商品信息
			List<CartDetails> cardDetails = cartService.getCartDetailsListByProdcutIds(cart.getId(), proIds);
			//应付总金额计算
			Double totalAmount = 0.0;
			for (CartDetails cartDetail : cardDetails) {
				totalAmount = BigDecimalUtils.add(totalAmount.doubleValue(), (cartDetail.getCount() * cartDetail.getPrice().doubleValue()));
			}
			totalAmount = BigDecimalUtils.round(totalAmount, 2);
			/**
			 * 订单部分
			 */
			//订单ID
			order.setId(PKIDUtils.getUuid());
			//生产订单号
			
			//商品总额
			order.setProductTotalAmount(BigDecimal.valueOf(totalAmount));
			//运费
			
			//优惠券抵扣
			if(StringUtils.isNotBlank(order.getCouponId())){
				UserCoupon ucoupon = userService.getUserCouponById(order.getCouponId());
				order.setCouponAmount(BigDecimal.valueOf(ucoupon.getAmount()));
				//实际应付
				order.setPractticalCoping(BigDecimal.valueOf(BigDecimalUtils.sub(order.getProductTotalAmount().doubleValue(), order.getCouponAmount().doubleValue())));
			}else{
				//实际应付
				order.setPractticalCoping(order.getProductTotalAmount());
			}
			
			//支付状态('0：待支付  1：已支付待发货  2：货物运输中 3：已完成 4：已作废')
			order.setStatus(BusConstants.ORDER_PAY_STATUS_NOTPAY);
			//订单基本初始化值
			order.setCreatedDate(new Date());
			order.setCreatedById(user.getId());
			order.setCreatedBy(user.getUserName());
			order.setUpdateDate(new Date());
			
			orderService.saveOrder(order);
			
			/**
			 * 订单明细部分
			 */
			for (CartDetails cartDetail : cardDetails) {
				OrderDetails orderDetail = new OrderDetails();
				orderDetail.setId(PKIDUtils.getUuid());
				orderDetail.setOrderId(order.getId());
				orderDetail.setProductId(cartDetail.getProductId());
				orderDetail.setCount(cartDetail.getCount());
				orderDetail.setEvaluateOrNot(BusConstants.ORDER_EVALUATION_STATUS_NO);
				orderService.saveOrderDetails(orderDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("订单保存模块处理出错!");
		}
		return null;
	}
	
	private String calculateExpectedArrivalTime(){
		String currDate = DateUtil.getTimeString();
		int hour = DateUtil.getHour(currDate);
		if(hour >= 8 && hour < 17){
			return DateUtil.StringToString(DateUtil.addHour(currDate, 2), "yyyy-MM-dd HH:mm");
		}else{
			return DateUtil.addDay(DateUtil.DateToString(DateUtil.parseTime(new Date(), "10:00"), "yyyy-MM-dd hh:mm"),2);
		}
	}
	
	public static void main(String[] args) {
	}
}

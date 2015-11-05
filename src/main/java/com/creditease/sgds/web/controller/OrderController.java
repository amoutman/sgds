package com.creditease.sgds.web.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.creditease.sgds.cart.bean.Cart;
import com.creditease.sgds.cart.bean.CartDetails;
import com.creditease.sgds.cart.service.CartService;
import com.creditease.sgds.order.model.Dictionary;
import com.creditease.sgds.order.model.Order;
import com.creditease.sgds.order.model.OrderDetails;
import com.creditease.sgds.order.service.DictionaryService;
import com.creditease.sgds.order.service.OrderService;
import com.creditease.sgds.product.service.ProductService;
import com.creditease.sgds.user.model.Receiver;
import com.creditease.sgds.user.model.User;
import com.creditease.sgds.user.model.UserCoupon;
import com.creditease.sgds.user.service.ReceiverService;
import com.creditease.sgds.user.service.UserCouponService;
import com.creditease.sgds.user.service.UserService;
import com.creditease.sgds.util.BigDecimalUtils;
import com.creditease.sgds.util.BusConstants;
import com.creditease.sgds.util.DateUtil;
import com.creditease.sgds.util.GlobalPara;
import com.creditease.sgds.util.PKIDUtils;
import com.creditease.sgds.util.PropertiesUtil;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController{
	
	@Resource(name="productService")
	private ProductService productService;
	
	@Resource(name="cartService")
	private CartService cartService;
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	@Resource(name="recevierService")
	private ReceiverService receiverService;
	
	@Resource(name="dictionaryService")
	private DictionaryService dictionaryService;
	
	@Resource(name="userCouponService")
	private UserCouponService userCouponService;
	
	/**
	 * 订单确认
	 * @param productIds
	 * @return
	 */
	@RequestMapping(value = "/orderConfirm",  method = RequestMethod.POST)
	public ModelAndView orderConfirm(@RequestParam(value="productIds", required=true)String productIds, @RequestParam(value="receiverId", required=false)String receiverId) {
		try {
			//获取用户信息
			User user = (User) this.getRequest().getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
			//初始化视图
			ModelAndView view = new ModelAndView("order/orderConfirm");
			//根据session中的用户ID查询用户地址信息
			Receiver receiver = null;
			if(StringUtils.isNotBlank(receiverId)){
				receiver = receiverService.getReceiverById(receiverId);
			}else{
				receiver = userService.selectDefReceiverByUserId(user.getId());
			}
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
				totalAmount = BigDecimalUtils.add(totalAmount.doubleValue(),  BigDecimalUtils.mul(Double.valueOf(cartDetail.getCount()), cartDetail.getPrice().doubleValue()));
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
	
	@ResponseBody
	@RequestMapping(value = "/changeAddr",  method = RequestMethod.POST)
	public ModelAndView changeAddress(){
		try {
			//获取用户信息
			User user = (User) this.getRequest().getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
			//初始化视图
			ModelAndView view = new ModelAndView();
			view.addObject("receivers", userService.selectReceiversByUserId(user.getId()));
			return view;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("变更地址模块处理失败!");
		}
	}
	
	@RequestMapping(value = "/prepareUpdateAddr")
	public ModelAndView prepareUpdateAddr(@RequestParam("receiverId")String receiverId, @RequestParam("productIds")String productIds){
		try {
			ModelAndView mv = new ModelAndView();
			Receiver receiver = receiverService.getReceiverById(receiverId);
			mv.addObject("receiver", receiver);
			mv.addObject("productIds", productIds);
			mv.setViewName("order/updateReceiver");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("前往修改地址页面异常!");
		}
	}
	
	@RequestMapping(value = "/updateAddr")
	public ModelAndView updateAddr(@ModelAttribute("receiver") Receiver receiver, @RequestParam("productIds")String productIds){
		try {
			receiver.setUpdatedDate(new Date());
			receiverService.updateReceiver(receiver);
			ModelMap mmap = new ModelMap(); 
			mmap.addAttribute("productIds", productIds);
			mmap.addAttribute("receiverId", receiver.getId());
			return new ModelAndView("redirect:/order/orderConfirm", mmap);  
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("修改地址模块异常!");
		}
	}
	
	@RequestMapping(value = "/prpareCreateAddr")
	public ModelAndView prpareCreateAddr(@RequestParam("productIds")String productIds){
		//初始化视图
		ModelAndView mv = new ModelAndView();
		mv.addObject("productIds", productIds);
		mv.setViewName("order/addReceiver");
		return mv;
	}
	
	@RequestMapping(value = "/createAddr")
	public ModelAndView createAddr(@ModelAttribute("receiver") Receiver receiver, @RequestParam("productIds")String productIds){
		//获取用户信息
		User user = (User) this.getRequest().getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
		receiver.setId(PKIDUtils.getUuid());
		receiver.setUserId(user.getId());
		String address = receiver.getReceiverProvince();
		StringBuffer adSb = new StringBuffer(address);
		adSb.append(receiver.getReceiverRegion());
		adSb.append(receiver.getReceiverAddress());
		receiver.setReceiverAddress(adSb.toString());
		receiver.setCreatedDate(new Date());
		receiverService.insertReceiver(receiver);
		ModelMap mmap = new ModelMap(); 
		mmap.addAttribute("productIds", productIds);
		mmap.addAttribute("receiverId", receiver.getId());
		return new ModelAndView("redirect:/order/orderConfirm", mmap);  
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkCoupon")
	public ModelAndView checkCoupon(@RequestParam("couponId")String couponId,@RequestParam("productIds")String productIds){
		ModelAndView view = new ModelAndView();
		try {
			//获取用户信息
			User user = (User) this.getRequest().getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
			//转换为List
			List<String> proIds = Arrays.asList(productIds.split(GlobalPara.SPLIT));
			//根据USER ID 获取购物车
			Cart cart = cartService.getCartById(user.getId());
			//根据 cardId 及 商品ID List 获取结算商品信息
			List<CartDetails> cardDetails = cartService.getCartDetailsListByProdcutIds(cart.getId(), proIds);
			//计算商品总金额
			Double totalAmount = 0.0;
			for (CartDetails cartDetail : cardDetails) {
				totalAmount = BigDecimalUtils.add(totalAmount.doubleValue(), BigDecimalUtils.mul(Double.valueOf(cartDetail.getCount()), cartDetail.getPrice().doubleValue()));
			}
			totalAmount = BigDecimalUtils.round(totalAmount, 2);
			//获取代金券金额
			UserCoupon coupon = userService.getUserCouponById(couponId);
			//计算实际应付金额
			Double actualAmountPay = BigDecimalUtils.sub(totalAmount, Double.valueOf(coupon.getAmount()));
			
			//初始化视图
			view.addObject(GlobalPara.AJAX_KEY,GlobalPara.AJAX_SUCCESS);
			view.addObject("actualAmountPay", actualAmountPay);
			return view;
		} catch (Exception e) {
			e.printStackTrace();
			view = new ModelAndView();
			view.addObject(GlobalPara.AJAX_KEY,GlobalPara.AJAX_FALSE+"操作失败!");
			return view;
		}
	}
	
	@RequestMapping(value = "/orderCommit",  method = RequestMethod.POST)
	public ModelAndView orderCommit(@ModelAttribute("order")Order order) {
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
			order.setOrderNo(getOrderNo());
			//收获人地址ID 页面提交
			//配送方式 0：送货上门  1：自取'
			order.setDistributionMode(BusConstants.ORDER_DISTRIBUTION_MODE_DELIVERY);
			//送货预计到达时间 页面提交
			//支付方式 0：微信    1：支付宝（默认微信） 在支付页面更新
			//商品总额
			order.setProductTotalAmount(BigDecimal.valueOf(totalAmount));
			//运费
			//使用优惠券ID 页面提交
			//优惠券抵扣
			if(StringUtils.isNotBlank(order.getCouponId())){
				UserCoupon ucoupon = userService.getUserCouponById(order.getCouponId());
				order.setCouponAmount(BigDecimal.valueOf(ucoupon.getAmount()));
				//实际应付
				order.setPractticalCoping(BigDecimal.valueOf(BigDecimalUtils.sub(order.getProductTotalAmount().doubleValue(), order.getCouponAmount().doubleValue())));
				//更新优惠劵状态
				ucoupon.setStatus(BusConstants.USER_COUPON_STATUS_USED);
				userCouponService.updateUserCouponById(ucoupon);
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
			List<String> cardDetailIds = new ArrayList<String>();
			for (CartDetails cartDetail : cardDetails) {
				OrderDetails orderDetail = new OrderDetails();
				orderDetail.setId(PKIDUtils.getUuid());
				orderDetail.setOrderId(order.getId());
				orderDetail.setProductId(cartDetail.getProductId());
				orderDetail.setCount(cartDetail.getCount());
				orderDetail.setEvaluateOrNot(BusConstants.ORDER_EVALUATION_STATUS_NO);
				orderService.saveOrderDetails(orderDetail);
				
				cardDetailIds.add(cartDetail.getId());
			}
			
			//删除购物车结算的商品信息
			if(cardDetailIds.size() > 0){
				cartService.deleteCartDetailsList(cardDetailIds);
			}
			
			ModelMap mmap = new ModelMap(); 
			mmap.addAttribute("orderId", order.getId());
			return new ModelAndView("redirect:/order/prepareOrderPay", mmap); 
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("订单保存模块处理出错!");
		}
	}
	
	@RequestMapping(value = "/prepareOrderPay",  method = RequestMethod.POST)
	public ModelAndView prepareOrderPay(@RequestParam("orderId")String orderId){
		try {
			ModelAndView mv = new ModelAndView();
			mv.addObject("orderId", orderId);
			mv.setViewName("order/updateReceiver");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("前往支付页面异常!");
		}
	}
	
	@RequestMapping(value = "/orderPay",  method = RequestMethod.POST)
	public ModelAndView orderPay(@RequestParam("orderId")String orderId, @RequestParam("payMode")Integer payMode){
		
		try {
			Order order = orderService.getOrderById(orderId);
			
			if(BusConstants.ORDER_PAY_MODE_WECHAT.equals(payMode)){
				
			}else if(BusConstants.ORDER_PAY_MODE_ALIPAY.equals(payMode)){
				
			}else if(BusConstants.ORDER_PAY_MODE_CASHONDELIVERY.equals(payMode)){
				order.setStatus(BusConstants.ORDER_PAY_STATUS_SENDING);
				order.setPayMode(BusConstants.ORDER_PAY_MODE_CASHONDELIVERY);
				orderService.updateOrderById(order);
			}
			
			return new ModelAndView("redirect:/userCenter/toUnReceiveOrder"); 
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("订单支付模块处理出错!");
		}
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
	
	private synchronized String getOrderNo() throws Exception{
		
		StringBuffer sb = new StringBuffer();
		sb.append(new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()));
		if(PropertiesUtil.getPropertiesValue("machineId")==null){
			PropertiesUtil.loadFile("config.properties");
		}
		String machineId = PropertiesUtil.getPropertiesValue("machineId");
		sb.append(machineId);
		//8为序列号.
		Dictionary dictionary = dictionaryService.getDictionaryByCode(GlobalPara.DICTIONARY_ORDER_CODE);
		if(dictionary == null){
			dictionary = new Dictionary();
			dictionary.setId(PKIDUtils.getUuid());
			dictionary.setCode(GlobalPara.DICTIONARY_ORDER_CODE);
			dictionary.setName("订单编号序列号");
			dictionary.setVal("00000001");
			dictionaryService.saveDictionary(dictionary);
		}else{
			Integer val = Integer.valueOf(dictionary.getVal());
			val++;
			String newVal = val.toString();
			for(int i = 0 ; i < 8 - newVal.length(); i++){
				newVal = "0" + newVal;
			}
			dictionary.setVal(newVal);
			dictionaryService.updateDictionary(dictionary);
		}
		sb.append(dictionary.getVal());
		return sb.toString();
	}
	
	public static void main(String[] args) {
	}
}

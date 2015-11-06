package com.creditease.sgds.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.creditease.sgds.order.model.Order;
import com.creditease.sgds.order.model.OrderDetails;
import com.creditease.sgds.order.service.OrderService;
import com.creditease.sgds.product.bean.ProductReview;
import com.creditease.sgds.product.service.ProductService;
import com.creditease.sgds.product.service.ReviewService;
import com.creditease.sgds.user.model.Receiver;
import com.creditease.sgds.user.model.User;
import com.creditease.sgds.user.model.UserCoupon;
import com.creditease.sgds.user.model.UserIntegral;
import com.creditease.sgds.user.service.ReceiverService;
import com.creditease.sgds.user.service.UserCouponService;
import com.creditease.sgds.user.service.UserIntegralService;
import com.creditease.sgds.util.GlobalPara;
import com.creditease.sgds.util.PKIDUtils;

@RequestMapping("/userCenter")
@Controller
public class UserCenterController {
	@Resource
	private UserCouponService userCouponService;
	
	@Resource
	private UserIntegralService userIntegralService;
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private ReceiverService receiverService;
	
	@Resource
	private ProductService productService;
	
	@Resource
	private ReviewService reviewService;
	
	@RequestMapping("/toUserCenter")
	public ModelAndView toUserCenter(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
		
		Map<String,Object> unPayMap = new HashMap<String,Object>();
		unPayMap.put("userId", user.getId());
		unPayMap.put("status", 0);
		int unPayCount = orderService.getOrderCountByParams(unPayMap);
		mv.addObject("unPayCount", unPayCount);
		
		Map<String,Object> unReceiveMap = new HashMap<String,Object>();
		unReceiveMap.put("userId", user.getId());
		unReceiveMap.put("status", 1);
		int unReceiveCount = orderService.getOrderCountByParams(unReceiveMap);
		mv.addObject("unReceiveCount", unReceiveCount);
		
		Map<String,Object> completeMap = new HashMap<String,Object>();
		completeMap.put("userId", user.getId());
		completeMap.put("status", 3);
		int completeCount = orderService.getOrderCountByParams(completeMap);
		mv.addObject("completeCount", completeCount);
		//待评价
		Map<String,Object> unEvaluatedMap = new HashMap<String,Object>();
		unEvaluatedMap.put("userId", user.getId());
		unEvaluatedMap.put("status", 3);
		unEvaluatedMap.put("evaluateOrNot", 0);
		int unEvaluatedCount = orderService.getUnEvaluatedCount(unEvaluatedMap);
		mv.addObject("unEvaluatedCount", unEvaluatedCount);
		
		Map<String,Object> ucMap = new HashMap<String,Object>();
		ucMap.put("userId", user.getId());
		ucMap.put("status", 0);
		int couponCount = userCouponService.getUserCouponCount(ucMap);
		mv.addObject("couponCount", couponCount);
		
		int integral = 0;
		if(userIntegralService.getUserIntegralSum(user.getId()) != null){
			integral = userIntegralService.getUserIntegralSum(user.getId());
		}
		mv.addObject("integral", integral);
		
		mv.addObject("user", user);
		mv.setViewName("user/userCenter");
		return mv;
	}
	
	@RequestMapping("/toUserCoupon")
	public ModelAndView toUserCoupon(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
		Map<String,Object> ucMap = new HashMap<String,Object>();
		ucMap.put("userId", user.getId());
		ucMap.put("status", 0);
		List<UserCoupon> ucList = userCouponService.getUserCouponList(ucMap);
		mv.addObject("ucList", ucList);
		mv.setViewName("user/userCoupon");
		return mv;
	}
	
	@RequestMapping("/toUserIntegral")
	public ModelAndView toUserIntegral(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		User user = (User)request.getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
		Integer integral = userIntegralService.getUserIntegralSum(user.getId());
		List<UserIntegral> uiList = userIntegralService.getUserIntegralList(user.getId());
		mv.addObject("integral", integral);
		mv.addObject("uiList", uiList);
		mv.setViewName("user/userIntegral");
		return mv;
	}
	
	@RequestMapping("/toUnPayOrder")
	public ModelAndView toUnPayOrder(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("userId", user.getId());
		paramMap.put("status", 0);
		List<Order> oList = orderService.getOrderListByParams(paramMap);
		List<Order> orderList = new ArrayList<Order>();
		if(oList.size()>0){
			for(Order o:oList){
				Receiver receiver = receiverService.getReceiverById(o.getReceiverId());
				o.setReceiver(receiver);
				orderList.add(o);
			}
		}
		mv.addObject("orderList", orderList);
		mv.setViewName("order/unPayOrder");
		return mv;
	}
	
	@RequestMapping("/toUnReceiveOrder")
	public ModelAndView toUnReceiveOrder(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("userId", user.getId());
		paramMap.put("status", 1);
		List<Order> oList = orderService.getOrderListByParams(paramMap);
		List<Order> orderList = new ArrayList<Order>();
		if(oList.size()>0){
			for(Order o:oList){
				Receiver receiver = receiverService.getReceiverById(o.getReceiverId());
				o.setReceiver(receiver);
				orderList.add(o);
			}
		}
		mv.addObject("orderList", orderList);
		mv.setViewName("order/unReceiveOrder");
		return mv;
	}
	
	@RequestMapping("/toUnPayOrderDetails")
	public ModelAndView toUnPayOrderDetails(HttpServletRequest request,@RequestParam("orderId") String orderId){
		ModelAndView mv = new ModelAndView();
		Order order = orderService.selectByPrimaryKey(orderId);
		List<OrderDetails> odList = orderService.getOrderDetailsListByOrderId(orderId);
		mv.addObject("order", order);
		mv.addObject("odList", odList);
		mv.setViewName("order/unPayOrderDetails");
		return mv;
	}
	
	@RequestMapping("/toUnReceiveOrderDetails")
	public ModelAndView toUnReceiveOrderDetails(HttpServletRequest request,@RequestParam("orderId") String orderId){
		ModelAndView mv = new ModelAndView();
		Order order = orderService.selectByPrimaryKey(orderId);
		List<OrderDetails> odList = orderService.getOrderDetailsListByOrderId(orderId);
		mv.addObject("order", order);
		mv.addObject("odList", odList);
		mv.setViewName("order/unReceiveOrderDetails");
		return mv;
	}
	
	@RequestMapping("/toCompletedOrder")
	public ModelAndView toCompletedOrder(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("userId", user.getId());
		paramMap.put("status", 3);
		List<Order> oList = orderService.getOrderListByParams(paramMap);
		List<Order> orderList = new ArrayList<Order>();
		for(int i=0;i<oList.size();i++){
			Order order = oList.get(i);
			List<OrderDetails> odList = orderService.getOrderDetailsListByOrderId(order.getId());
			order.setOdList(odList);
			orderList.add(order);
		}
		mv.addObject("orderList", orderList);
		mv.setViewName("order/completedOrder");
		return mv;
	}
	
	@RequestMapping("/toUnEvaluatedOrder")
	public ModelAndView toUnEvaluatedOrder(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("userId", user.getId());
		paramMap.put("status", 3);
		paramMap.put("evaluateOrNot", 0);
		List<OrderDetails> odList = orderService.getUnEvaluatedList(paramMap);
		mv.addObject("odList", odList);
		mv.setViewName("order/unEvaluatedOrder");	
		return mv;
	}
	
	@RequestMapping("/toEvaluate")
	public ModelAndView toEvaluate(HttpServletRequest request,@RequestParam("orderDetailsId") String orderDetailsId){
		ModelAndView mv = new ModelAndView();
		OrderDetails orderDetails = orderService.getOrderDetailsById(orderDetailsId);
		mv.addObject("orderDetails", orderDetails);
		mv.setViewName("order/review");
		return mv;
	}
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> insertReview(HttpServletRequest request,@RequestParam("productId") String productId,@RequestParam("orderDetailsId") String orderDetailsId,
			@RequestParam("level") String level,@RequestParam("descInfo") String descInfo){
		User user = (User)request.getSession().getAttribute("user");
		Map<String,Object> resultMap = new HashMap<String,Object>();
		ProductReview pr = new ProductReview();
		pr.setId(PKIDUtils.getUuid());
		pr.setProductId(productId);
		pr.setDescInfo(descInfo);
		pr.setLevel(Integer.parseInt(level));
		pr.setCreatedBy(user.getUserName());
		pr.setCreatedById(user.getId());
		pr.setCreatedDate(new Date());
		reviewService.insertReview(pr);
		//更改订单是否评价状态
		OrderDetails od = new OrderDetails();
		od.setId(orderDetailsId);
		od.setEvaluateOrNot(1);
		orderService.updateOrderReviewStatus(od);
		
		resultMap.put("success", true);
		resultMap.put("msg", "您已成功评价商品");
		return resultMap;
	}
	
	@RequestMapping("/toOrderDetails")
	public ModelAndView toOrderDetails(HttpServletRequest request,@RequestParam("orderId") String orderId){
		ModelAndView mv = new ModelAndView();
		Order order = orderService.selectByPrimaryKey(orderId);
		List<OrderDetails> odList = orderService.getOrderDetailsListByOrderId(orderId);
		Receiver receiver = receiverService.getReceiverById(order.getReceiverId());
		mv.addObject("order", order);
		mv.addObject("odList", odList);
		mv.addObject("receiver", receiver);
		mv.setViewName("order/orderDetails");
		return mv;
	}
	
	@RequestMapping(value = "/deleteOrder",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteOrder(HttpServletRequest request,@RequestParam("orderId") String orderId){
		Map<String,Object> resultMap= new HashMap<String,Object>();
		Order order = new Order();
		order.setId(orderId);
		order.setStatus(4);
		orderService.updateByPrimaryKeySelective(order);
		resultMap.put("success", true);
		resultMap.put("msg", "删除订单成功！");
		return resultMap;
	}
}

package com.creditease.sgds.web.controller;

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

import com.creditease.sgds.product.bean.Product;
import com.creditease.sgds.product.bean.ProductDetailPic;
import com.creditease.sgds.product.bean.ProductReview;
import com.creditease.sgds.product.service.CategoryService;
import com.creditease.sgds.product.service.ProductService;
import com.creditease.sgds.product.service.ReviewService;
import com.creditease.sgds.user.model.User;
import com.creditease.sgds.util.GlobalPara;
import com.creditease.sgds.util.PKIDUtils;

@RequestMapping("/product")
@Controller
public class ProductController {
	@Resource
	private ProductService productService;
	@Resource
	private CategoryService categoryService;
	@Resource
	private ReviewService reviewService;
	
	@RequestMapping("/toProductDetails")
	public ModelAndView toProductDetails(HttpServletRequest request, @RequestParam("productId") String productId){
		ModelAndView mv = new ModelAndView();
		Product product = productService.getProductById(productId);
		mv.addObject("product", product);
		List<ProductDetailPic> pdpList = productService.getProductDetPicList(productId);
		mv.addObject("pdpList", pdpList);
		List<ProductReview> prList = productService.getProductReviewList(productId);
		mv.addObject("prList", prList);
		mv.setViewName("product/productDetails");
		return mv;
	}
	
	@RequestMapping("/toProductReview")
	public ModelAndView toProductReview(HttpServletRequest request,@RequestParam("productId") String productId,@RequestParam("orderId") String orderId){
		ModelAndView mv = new ModelAndView();
		User user = (User) request.getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
		Product product = productService.getProductById(productId);
		mv.addObject("product", product);
		mv.addObject("orderId", orderId);
		mv.setViewName("product/review");
		return mv;
	}
	
	@RequestMapping("/toUnReview")
	public ModelAndView toUnReview(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		return mv;
	}
}

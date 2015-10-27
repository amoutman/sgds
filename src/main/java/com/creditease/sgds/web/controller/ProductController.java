package com.creditease.sgds.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.creditease.sgds.product.bean.Product;
import com.creditease.sgds.product.bean.ProductDetailPic;
import com.creditease.sgds.product.bean.ProductReview;
import com.creditease.sgds.product.service.CategoryService;
import com.creditease.sgds.product.service.ProductService;

@RequestMapping("/product")
@Controller
public class ProductController {
	@Resource
	private ProductService productService;
	@Resource
	private CategoryService categoryService;
	
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
}

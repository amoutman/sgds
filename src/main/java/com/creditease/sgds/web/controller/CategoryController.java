package com.creditease.sgds.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.creditease.sgds.product.bean.Category;
import com.creditease.sgds.product.bean.Product;
import com.creditease.sgds.product.service.CategoryService;
import com.creditease.sgds.product.service.ProductService;

@RequestMapping("/category")
@Controller
public class CategoryController {
	@Resource
	private ProductService productService;
	@Resource
	private CategoryService categoryService;
	
	@RequestMapping("toProductCategory")
	public ModelAndView toProductCategory(HttpServletRequest request, @RequestParam("categoryId") String categoryId){
		ModelAndView mv = new ModelAndView();
		List<Product> pList = productService.getProductByCategoryId(categoryId);
		mv.addObject("pList", pList);
		
		Map<String,Object> cMap = new HashMap<String,Object>();
		cMap.put("status", 0);	
		List<Category> cList = categoryService.getCategoryList(cMap);
		mv.addObject("cList", cList);
		mv.setViewName("product/category.jsp");
		return mv;
	}
}

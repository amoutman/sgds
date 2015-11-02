package com.creditease.sgds.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.creditease.sgds.master.bean.Advertisement;
import com.creditease.sgds.master.service.AdvertService;
import com.creditease.sgds.product.bean.Category;
import com.creditease.sgds.product.bean.HotProduct;
import com.creditease.sgds.product.service.CategoryService;
import com.creditease.sgds.product.service.HotProductService;

@RequestMapping("/index")
@Controller
public class IndexController {
	@Resource
	private AdvertService advertService;
	@Resource
	private CategoryService categoryService;
	@Resource
	private HotProductService hotProductService;
	
	@RequestMapping("/toIndexPage")
	public ModelAndView toIndexPage(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		Map<String,Object> aMap = new HashMap<String,Object>();
		aMap.put("status", 0);
		List<Advertisement> aList = advertService.getAdvertList(aMap);
		mv.addObject("aList", aList);
		Map<String,Object> cMap = new HashMap<String,Object>();
		cMap.put("status", 0);
		List<Category> cList = categoryService.getCategoryList(cMap);
		mv.addObject("cList", cList);
		Map<String,Object> hMap = new HashMap<String,Object>();
		hMap.put("status", 0);
		List<HotProduct> hList = hotProductService.getHotProductList(hMap);
		mv.addObject("hList", hList);
		mv.setViewName("index/indexPage");
		return mv;
	}
}

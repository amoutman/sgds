package com.creditease.sgds.product.service;

import java.util.List;
import java.util.Map;

import com.creditease.sgds.product.bean.Category;

public interface CategoryService {
public List<Category> getCategoryList(Map<String,Object> cMap);
	
	public Category getCategoryById(String id);
	
	public void insertCategory(Category category);
	
	public void updateCategory(Category category);
	
	public void deleteCategory(String id);

}

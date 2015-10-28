package com.creditease.sgds.product.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creditease.sgds.product.bean.Category;
import com.creditease.sgds.product.dao.CategoryMapper;
import com.creditease.sgds.product.service.CategoryService;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	
	private CategoryMapper categoryMapper;

	@Autowired
	public void setCategoryMapper(CategoryMapper categoryMapper) {
		this.categoryMapper = categoryMapper;
	}

	@Override
	public List<Category> getCategoryList(Map<String, Object> cMap) {
		// TODO Auto-generated method stub
		return categoryMapper.getCategoryList(cMap);
	}

	@Override
	public Category getCategoryById(String id) {
		// TODO Auto-generated method stub
		return categoryMapper.getCategoryById(id);
	}

	@Override
	public void insertCategory(Category category) {
		// TODO Auto-generated method stub
		categoryMapper.insertCategory(category);
	}

	@Override
	public void updateCategory(Category category) {
		// TODO Auto-generated method stub
		categoryMapper.updateCategory(category);
	}

	@Override
	public void deleteCategory(String id) {
		// TODO Auto-generated method stub
		categoryMapper.deleteCategory(id);
	}

}

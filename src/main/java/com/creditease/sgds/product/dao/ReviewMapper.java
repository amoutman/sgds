package com.creditease.sgds.product.dao;

import java.util.List;

import com.creditease.sgds.product.bean.ProductReview;

public interface ReviewMapper {
	public void insertReview(ProductReview pr);
	
	public List<ProductReview> getProductReviewList(String id);

}

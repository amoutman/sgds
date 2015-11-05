package com.creditease.sgds.product.service;

import java.util.List;

import com.creditease.sgds.product.bean.ProductReview;

public interface ReviewService {
	public void insertReview(ProductReview pr);
	
	public List<ProductReview> getProductReviewList(String id);

}

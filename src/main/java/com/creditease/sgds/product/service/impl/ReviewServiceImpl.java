package com.creditease.sgds.product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creditease.sgds.product.bean.ProductReview;
import com.creditease.sgds.product.dao.ReviewMapper;
import com.creditease.sgds.product.service.ReviewService;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	
	private ReviewMapper reviewMapper;
	
	@Autowired
	public void setReviewMapper(ReviewMapper reviewMapper) {
		this.reviewMapper = reviewMapper;
	}

	@Override
	public void insertReview(ProductReview pr) {
		// TODO Auto-generated method stub
		reviewMapper.insertReview(pr);
	}

	@Override
	public List<ProductReview> getProductReviewList(String id) {
		// TODO Auto-generated method stub
		return reviewMapper.getProductReviewList(id);
	}

}

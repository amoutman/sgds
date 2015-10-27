package com.creditease.sgds.product.dao;

import java.util.List;
import java.util.Map;

import com.creditease.sgds.product.bean.Product;
import com.creditease.sgds.product.bean.ProductDetailPic;
import com.creditease.sgds.product.bean.ProductReview;

public interface ProductMapper {
	public List<Product> getProductList(Map<String,Object> pMap);
	
	public List<Product> getProductDetailList(Map<String,Object> pdMap);
	
	public List<ProductDetailPic> getProductDetPicList(String id);
	
	public List<ProductReview> getProductReviewList(String id);
	
	public Product getProductById(String id);
	
	public List<Product> getProductByCategoryId(String categoryId);
	
	public void insertProduct(Product product);
	
	public void updateProduct(Product product);
	
	public void deleteProduct(String id);
}

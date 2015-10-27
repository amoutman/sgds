package com.creditease.sgds.product.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creditease.sgds.product.bean.Product;
import com.creditease.sgds.product.bean.ProductDetailPic;
import com.creditease.sgds.product.bean.ProductReview;
import com.creditease.sgds.product.dao.ProductMapper;
import com.creditease.sgds.product.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	private ProductMapper productMapper;
	
	@Autowired
	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}

	@Override
	public List<Product> getProductList(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return productMapper.getProductList(pMap);
	}
	
	public List<Product> getProductDetailList(Map<String,Object> pdMap){
		return productMapper.getProductDetailList(pdMap);
	}
	
	public List<ProductDetailPic> getProductDetPicList(String id){
		return productMapper.getProductDetPicList(id);
	}
	
	public List<ProductReview> getProductReviewList(String id){
		return productMapper.getProductReviewList(id);
	}

	@Override
	public Product getProductById(String id) {
		// TODO Auto-generated method stub
		return productMapper.getProductById(id);
	}
	
	public List<Product> getProductByCategoryId(String categoryId){
		return productMapper.getProductByCategoryId(categoryId);
	}

	@Override
	public void insertProduct(Product product) {
		// TODO Auto-generated method stub
		productMapper.insertProduct(product);
	}

	@Override
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		productMapper.updateProduct(product);
	}

	@Override
	public void deleteProduct(String id) {
		// TODO Auto-generated method stub
		productMapper.deleteProduct(id);
	}

}

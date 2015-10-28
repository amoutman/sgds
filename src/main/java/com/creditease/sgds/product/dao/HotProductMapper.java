package com.creditease.sgds.product.dao;

import java.util.List;
import java.util.Map;

import com.creditease.sgds.product.bean.HotProduct;

public interface HotProductMapper {
	public List<HotProduct> getHotProductList(Map<String,Object> hMap);
	
	public HotProduct getHotProductById(String id);
	
	public void insertHotProduct(HotProduct hotProduct);
	
	public void updateHotProduct(HotProduct hotProduct);
	
	public void deleteHotProduct(String id);
}

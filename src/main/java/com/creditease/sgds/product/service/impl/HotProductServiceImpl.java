package com.creditease.sgds.product.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creditease.sgds.product.bean.HotProduct;
import com.creditease.sgds.product.dao.HotProductMapper;
import com.creditease.sgds.product.service.HotProductService;

@Service("hitProductService")
public class HotProductServiceImpl implements HotProductService {

	private HotProductMapper hotProductMapper;
	
	@Autowired
	public void setHotProductMapper(HotProductMapper hotProductMapper) {
		this.hotProductMapper = hotProductMapper;
	}

	@Override
	public List<HotProduct> getHotProductList(Map<String, Object> hMap) {
		// TODO Auto-generated method stub
		return hotProductMapper.getHotProductList(hMap);
	}

	@Override
	public HotProduct getHotProductById(String id) {
		// TODO Auto-generated method stub
		return hotProductMapper.getHotProductById(id);
	}

	@Override
	public void insertHotProduct(HotProduct hotProduct) {
		// TODO Auto-generated method stub
		hotProductMapper.insertHotProduct(hotProduct);
	}

	@Override
	public void updateHotProduct(HotProduct hotProduct) {
		// TODO Auto-generated method stub
		hotProductMapper.updateHotProduct(hotProduct);
	}

	@Override
	public void deleteHotProduct(String id) {
		// TODO Auto-generated method stub
		hotProductMapper.deleteHotProduct(id);
	}

}

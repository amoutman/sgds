package com.creditease.sgds.master.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creditease.sgds.master.bean.Advertisement;
import com.creditease.sgds.master.dao.AdvertMapper;
import com.creditease.sgds.master.service.AdvertService;

@Service("advertService")
public class AdvertServiceImpl implements AdvertService {
	
	private AdvertMapper advertMapper;

	@Autowired
	public void setAdvertMapper(AdvertMapper advertMapper) {
		this.advertMapper = advertMapper;
	}

	@Override
	public List<Advertisement> getAdvertList(Map<String,Object> aMap) {
		// TODO Auto-generated method stub
		return advertMapper.getAdvertList(aMap);
	}

	@Override
	public Advertisement getAdvert(Advertisement advert) {
		// TODO Auto-generated method stub
		return advertMapper.getAdvert(advert);
	}

	@Override
	public Advertisement getAdvertById(String id) {
		// TODO Auto-generated method stub
		return advertMapper.getAdvertById(id);
	}

	@Override
	public void insertAdvert(Advertisement advert) {
		// TODO Auto-generated method stub
		advertMapper.insertAdvert(advert);
	}

	@Override
	public void updateAdvert(Advertisement advert) {
		// TODO Auto-generated method stub
		advertMapper.updateAdvert(advert);
	}

	@Override
	public void deleteAdvert(String id) {
		// TODO Auto-generated method stub
		advertMapper.deleteAdvert(id);
	}

}

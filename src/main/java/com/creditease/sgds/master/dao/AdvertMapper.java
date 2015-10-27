package com.creditease.sgds.master.dao;

import java.util.List;
import java.util.Map;

import com.creditease.sgds.master.bean.Advertisement;

public interface AdvertMapper {
	
	public List<Advertisement> getAdvertList(Map<String,Object> aMap);
	
	public Advertisement getAdvert(Advertisement advert);
	
	public Advertisement getAdvertById(String id);
	
	public void insertAdvert(Advertisement advert);
	
	public void updateAdvert(Advertisement advert);
	
	public void deleteAdvert(String id);

}

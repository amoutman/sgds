package com.creditease.sgds.user.dao;

import java.util.List;
import java.util.Map;

import com.creditease.sgds.user.bean.Receiver;

public interface ReceiverMapper {
	
	public Receiver getReceiverById(String id);
	
	public Receiver getReceiverByUserId(String userId);
	
	public List<Receiver> getReceiverList(Map<String,Object> rMap);
	
	public List<Receiver> getReceiverListByUserId(String userId);
	
	public void insertReceiver(Receiver receiver);
	
	public void updateReceiver(Receiver receiver);
	
	public void deleteReceiver(String receiverId);
	
	public void updateDefault(String id);
	
	public void updateUnDefault(String userId);

}

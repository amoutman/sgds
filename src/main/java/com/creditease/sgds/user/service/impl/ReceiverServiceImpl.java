package com.creditease.sgds.user.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creditease.sgds.user.bean.Receiver;
import com.creditease.sgds.user.dao.ReceiverMapper;
import com.creditease.sgds.user.service.ReceiverService;

@Service("recevierService")
public class ReceiverServiceImpl implements ReceiverService {

	private ReceiverMapper receiverMapper;
	
	@Autowired
	public void setReceiverMapper(ReceiverMapper receiverMapper) {
		this.receiverMapper = receiverMapper;
	}

	@Override
	public Receiver getReceiverById(String id) {
		// TODO Auto-generated method stub
		return receiverMapper.getReceiverById(id);
	}

	@Override
	public Receiver getReceiverByUserId(String userId) {
		// TODO Auto-generated method stub
		return receiverMapper.getReceiverByUserId(userId);
	}

	@Override
	public List<Receiver> getReceiverList(Map<String, Object> rMap) {
		// TODO Auto-generated method stub
		return receiverMapper.getReceiverList(rMap);
	}
	
	public List<Receiver> getReceiverListByUserId(String userId){
		return receiverMapper.getReceiverListByUserId(userId);
	}

	@Override
	public void insertReceiver(Receiver receiver) {
		// TODO Auto-generated method stub
		receiverMapper.insertReceiver(receiver);
	}

	@Override
	public void updateReceiver(Receiver receiver) {
		// TODO Auto-generated method stub
		receiverMapper.updateReceiver(receiver);
	}

	@Override
	public void deleteReceiver(String receiverId) {
		// TODO Auto-generated method stub
		receiverMapper.deleteReceiver(receiverId);
	}
	
	public void updateDefault(String id){
	
		receiverMapper.updateUnDefault();
		receiverMapper.updateDefault(id);
	}
}

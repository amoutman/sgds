package com.creditease.sgds.web.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.creditease.sgds.user.bean.Receiver;
import com.creditease.sgds.user.bean.User;
import com.creditease.sgds.user.service.ReceiverService;
import com.creditease.sgds.util.PKIDUtils;

@RequestMapping("/receiver")
@Controller
public class ReceiverController {
	
	@Resource
	private ReceiverService receiverService;

	
	@RequestMapping("/toReceiver")
	public ModelAndView toReceiver(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute("user");
		List<Receiver> rList = receiverService.getReceiverListByUserId(user.getId());
		mv.addObject("rList", rList);
		mv.setViewName("user/receiver");
		return mv;
	}
	
	@RequestMapping("/toInsertReceiver")
	public ModelAndView toInsertReceiver(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/addReceiver");
		return mv;
	}
	
	@RequestMapping("/insertReceiver")
	public ModelAndView insertReceiver(HttpServletRequest request,@ModelAttribute("receiver") Receiver receiver){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute("user");
		receiver.setId(PKIDUtils.getUuid());
		receiver.setUserId(user.getId());
		String address = receiver.getReceiverProvince();
		StringBuffer adSb = new StringBuffer(address);
		adSb.append(receiver.getReceiverRegion());
		adSb.append(receiver.getReceiverAddress());
		receiver.setReceiverAddress(adSb.toString());
		receiver.setCreatedDate(new Date());
		receiverService.insertReceiver(receiver);
		mv.setViewName("redirect:/receiver/toReceiver");
		return mv;
	}
	
	@RequestMapping("/toUpdateReceiver")
	public ModelAndView toUpdateReceiver(HttpServletRequest request,@RequestParam("receiverId") String receiverId){
		ModelAndView mv = new ModelAndView();
		Receiver receiver = receiverService.getReceiverById(receiverId);
		mv.addObject("receiver", receiver);
		mv.setViewName("receiver/updateReceiver");
		return mv;
	}
	
	@RequestMapping("/updateReceiver")
	public ModelAndView updateReceiver(HttpServletRequest request,@ModelAttribute("receiver") Receiver receiver){
		ModelAndView mv = new ModelAndView();
		receiver.setUpdatedDate(new Date());
		receiverService.updateReceiver(receiver);
		mv.setViewName("redirect:/receiver/toReceiver");
		return mv;
	}
	
	@RequestMapping("/updateReceiverDefault")
	public void updateReceiverDefault(HttpServletRequest request,@RequestParam("receiverId") String receiverId){
		receiverService.updateDefault(receiverId);
	}
}

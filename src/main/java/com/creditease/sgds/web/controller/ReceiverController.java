package com.creditease.sgds.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.creditease.sgds.user.model.Receiver;
import com.creditease.sgds.user.model.User;
import com.creditease.sgds.user.service.ReceiverService;
import com.creditease.sgds.util.GlobalPara;
import com.creditease.sgds.util.PKIDUtils;

@RequestMapping("/receiver")
@Controller
public class ReceiverController {
	
	@Resource
	private ReceiverService receiverService;

	
	@RequestMapping("/toReceiver")
	public ModelAndView toReceiver(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		User user = (User)request.getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
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
		User user = (User)request.getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
		List<Receiver> rList = receiverService.getReceiverListByUserId(user.getId());
		if(rList.isEmpty()){
			receiver.setMasterOrNot(0);
		}else{
			receiver.setMasterOrNot(1);
		}
		receiver.setId(PKIDUtils.getUuid());
		receiver.setUserId(user.getId());
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
		mv.setViewName("user/updateReceiver");
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
	
	@RequestMapping(value = "/updateReceiverDefault",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateReceiverDefault(HttpServletRequest request,@RequestParam("receiverId") String receiverId){
		Map<String,Object> result = new HashMap<String,Object>();
		User user = (User)request.getSession().getAttribute(GlobalPara.USER_SESSION_TOKEN);
		receiverService.updateDefault(receiverId,user.getId());
		result.put("success", true);
		return result;
	}
}

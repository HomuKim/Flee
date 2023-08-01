package com.flee.chat.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flee.chat.service.ChatService;
import com.flee.common.CommandMap;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ChatController {
	
	private ChatService chatService;
	
	  @RequestMapping(value="/createChat.fe")
	  public ModelAndView joinForm(CommandMap commandMap) throws Exception{
	      ModelAndView mv=new ModelAndView("redirect:/chatList.fe");
	      
	      chatService.createChatRoom(commandMap.getMap());
	      int count = chatService.createMessage(commandMap.getMap());
	      
	      mv.addObject("CROOM_IDX", commandMap.get("CROOM_IDX"));
	      return mv;      
	   }
	   
	  @RequestMapping(value="/chatList.fe")
	  public ModelAndView getChatList(CommandMap commandMap) throws Exception{
	      ModelAndView mv=new ModelAndView("chat/chatList");

	      return mv;      
	   }
	  
	  @RequestMapping(value="/selectChatList.fe")
	  public ModelAndView selectChatList(CommandMap commandMap) throws Exception{
		  ModelAndView mv = new ModelAndView("jsonView");

		  List<Map<String, Object>> chatList = chatService.getChatList(commandMap.getMap());
			mv.addObject("list", chatList);
			if (chatList.size() > 0) {
				mv.addObject("TOTAL", chatList.get(0).get("TOTAL_COUNT"));
			}
			else{
				mv.addObject("TOTAL", 0);
			}
			
			return mv;    
	   }

}

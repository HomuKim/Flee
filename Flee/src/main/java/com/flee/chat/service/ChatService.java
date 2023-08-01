package com.flee.chat.service;

import java.util.List;
import java.util.Map;

public interface ChatService {
	
	public void createChatRoom(Map<String, Object> map) throws Exception;
	
	public int createMessage(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> getChatRoom(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> getMessageList(int croomidx,Map<String, Object> map) throws Exception;

	public Map<String, Object> getLastMessage(int croomidx) throws Exception;
	
	public List<Map<String, Object>> getChatList(Map<String, Object> map) throws Exception;

	public Map<String, Object> getReadcheck(String nickname) throws Exception;
}

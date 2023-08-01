package com.flee.chat.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("chatDAO")
public class ChatDAO extends AbstractDAO {

	public void createChatRoom(Map<String, Object> map) throws Exception {
		insert("chat.createChatRoom", map);
	}

	public int createMessage(Map<String, Object> map) throws Exception {
		return (int) insert("chat.createMessage", map);
	}

	public Map<String, Object> getChatRoom(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("chat.getChatRoom", map);
	}

	public List<Map<String, Object>> getMessageList(int croomidx) throws Exception {
		return (List<Map<String, Object>>) selectList("chat.getMessageList", croomidx);
	}

	public List<Map<String, Object>> getChatList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("chat.getChatList", map);
	}

	public Map<String, Object> getLastMessage(int Croom_idx) throws Exception {
		return (Map<String, Object>) selectOne("chat.getLastMessage", Croom_idx);
	}

	public int updateReadcheck(Map<String, Object> map) throws Exception {
		return (int) update("chat.updateReadcheck", map);
	}

	public int getReadcheck(String nickname) throws Exception {
		return (int) selectOne("chat.getReadcheck", nickname);
	}

}

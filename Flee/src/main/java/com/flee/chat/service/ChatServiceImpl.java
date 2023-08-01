package com.flee.chat.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flee.chat.dao.ChatDAO;
import com.flee.member.dao.LoginDAO;

import lombok.AllArgsConstructor;

@Service("chatService")
@AllArgsConstructor
public class ChatServiceImpl implements ChatService {

	private ChatDAO chatDAO;
	private LoginDAO loginDAO;

	@Override
	public void createChatRoom(Map<String, Object> map) throws Exception {
		chatDAO.createChatRoom(map);

	}

	@Override
	public Map<String, Object> getChatRoom(Map<String, Object> map) throws Exception {
		return chatDAO.getChatRoom(map);
	}

	@Override
	public int createMessage(Map<String, Object> map) throws Exception {
		return chatDAO.createMessage(map);

	}

	@Transactional
	@Override
	public List<Map<String, Object>> getMessageList(int croomidx, Map<String, Object> map) throws Exception {
		chatDAO.updateReadcheck(map); // 읽음 표시
		return chatDAO.getMessageList(croomidx);

	}

	@Override
	public Map<String, Object> getLastMessage(int croomidx) throws Exception {
		return chatDAO.getLastMessage(croomidx);
	}

	@Override
	public List<Map<String, Object>> getChatList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> chatList = chatDAO.getChatList(map);

		for (Map<String, Object> chat : chatList) {
			Map<String, Object> member = new HashMap<>();
			if (!String.valueOf(chat.get("SEND_NICKNAME")).equals(String.valueOf(map.get("M_NICKNAME")))) {
				member.put("M_NICKNAME", chat.get("SEND_NICKNAME"));
				chat.put("chatMember", loginDAO.getMemberByNickname(member));
			} else {
				member.put("M_NICKNAME", chat.get("RECV_NICKNAME"));
				chat.put("chatMember", loginDAO.getMemberByNickname(member));
			}

			int croomidx = Integer.parseInt(String.valueOf(chat.get("CROOM_IDX")));
			Map<String, Object> last = chatDAO.getLastMessage(croomidx);
			String lastMessage = String.valueOf(last.get("MES_CONTENT"));
			if (!String.valueOf(last.get("SEND_NICKNAME")).equals(String.valueOf(map.get("M_NICKNAME")))) {
				if (String.valueOf(last.get("READCHECK")).equals("1")) {
					chat.put("check", true);
				} else {
					chat.put("check", false);
				}
			}
			chat.put("lastMessage", lastMessage);
		}

		return chatList;
	}

	@Override
	public Map<String, Object> getReadcheck(String nickname) throws Exception {
		int readcheck = chatDAO.getReadcheck(nickname);
		Map<String, Object> map = new HashMap<>();
		if (readcheck > 0) {
			map.put("readcheck", true);
		} else {
			map.put("readcheck", false);
		}

		return map;
	}

}

package com.flee.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.flee.chat.service.ChatService;
import com.flee.member.service.LoginService;

import lombok.AllArgsConstructor;

@RequestMapping("/chat/")
@RestController
@AllArgsConstructor
public class MessageController {

	private ChatService chatService;
	private LoginService loginService;

	@RequestMapping(value = "/new", method = RequestMethod.POST, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> createMessage(@RequestBody Map<String, Object> map) throws Exception {
		int count = chatService.createMessage(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(value = "/{croomidx}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> getMessageList(@PathVariable("croomidx") int croomidx,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("CROOM_IDX", croomidx);
		paramMap.put("M_NICKNAME", session.getAttribute("NICKNAME"));

		Map<String, Object> resultMap = new HashMap<>();
		// 메시지 리스트 가져오기
		List<Map<String, Object>> list = chatService.getMessageList(croomidx, paramMap);
		resultMap.put("list", list);
		// 방 번호에 해당하는 메시지 리스트 중 가장 최근의 메시지 한 테이블 가져오기
		Map<String, Object> lastMessage = chatService.getLastMessage(croomidx);
		if (!String.valueOf(lastMessage.get("SEND_NICKNAME"))
				.equals(String.valueOf(session.getAttribute("NICKNAME")))) {
			paramMap.put("M_NICKNAME", lastMessage.get("SEND_NICKNAME"));
			lastMessage.put("chatMember", loginService.getMemberByNickname(paramMap));
		} else {
			paramMap.put("M_NICKNAME", lastMessage.get("RECV_NICKNAME"));
			lastMessage.put("chatMember", loginService.getMemberByNickname(paramMap));
		}
		resultMap.put("lastMessage", lastMessage);

		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
	}

	@RequestMapping(value = "/readcheck/{nickname}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> get(@PathVariable("nickname") String nickname) throws Exception {

		return new ResponseEntity<Map<String, Object>>(chatService.getReadcheck(nickname), HttpStatus.OK);
	}
}

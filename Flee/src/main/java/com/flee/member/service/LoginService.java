package com.flee.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


public interface LoginService {

	public Map<String, Object> getMember(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> getMemberByNickname(Map<String, Object> map) throws Exception;

	public Map<String, Object> findEmail(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> findPassword(Map<String, Object> map) throws Exception;

}
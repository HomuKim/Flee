package com.flee.member.service;


import java.util.Map;

import org.springframework.stereotype.Service;

import com.flee.member.dao.LoginDAO;

import lombok.AllArgsConstructor;

@Service("loginService")
@AllArgsConstructor
public class LoginServiceImpl implements LoginService{
	
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> getMember(Map<String, Object> map) throws Exception {
		return loginDAO.getMember(map);
	}
	
	@Override
	public Map<String, Object> getMemberByNickname(Map<String, Object> map) throws Exception {
		return loginDAO.getMemberByNickname(map);
	}

	@Override
	public Map<String, Object> findEmail(Map<String, Object> map) throws Exception {
		return loginDAO.findEmail(map);
	}

	@Override
	public Map<String, Object> findPassword(Map<String, Object> map) throws Exception {
		return loginDAO.findPassword(map);
	}

}


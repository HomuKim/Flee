package com.flee.member.dao;

import java.util.List;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{ 

	@SuppressWarnings("unchecked")
	public Map<String, Object> getMember(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.getMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getMemberByNickname(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.getMemberByNickname", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> findEmail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.findEmail", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> findPassword(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.findPassword", map);
	}


}

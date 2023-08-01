package com.flee.member.dao;

import java.util.Map;


import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;


@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{
	
	public int getEmailCheck(String email) throws Exception{
		return (Integer)selectOne("member.emailCheck", email);
	}
	
	public void insertMember(Map<String, Object> map) throws Exception {
		insert("member.insertMember",map);
	}
	
	public void insertMemberCategory(Map<String, Object> map) throws Exception {
		insert("member.insertMemberCategory",map);
	}
	
	public int getNickCheck(String nick) throws Exception{
		return (Integer) selectOne("member.nickCheck",nick);
	}
}
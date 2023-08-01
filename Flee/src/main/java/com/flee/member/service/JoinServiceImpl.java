package com.flee.member.service;


import java.util.Map;

import org.springframework.stereotype.Service;
import com.flee.member.dao.JoinDAO;

import lombok.AllArgsConstructor;

@Service("joinService")
@AllArgsConstructor
public class JoinServiceImpl implements JoinService{

	private JoinDAO joinDAO;
	
	@Override
	public int getEmailCheck(String email) throws Exception {
		return joinDAO.getEmailCheck(email);
	}

	@Override
	public void insertMember(Map<String, Object> map) throws Exception {
		joinDAO.insertMember(map);
	}

	@Override
	public void insertMemberCategory(Map<String, Object> map) throws Exception {
		joinDAO.insertMemberCategory(map);
	}

	@Override
	public int getNickCheck(String nick) throws Exception {
		return joinDAO.getNickCheck(nick);
	}

}
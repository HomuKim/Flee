package com.flee.member.service;

import java.util.Map;

public interface JoinService {

	int getEmailCheck(String email) throws Exception;

	void insertMember(Map<String, Object> map) throws Exception;
	
	void insertMemberCategory(Map<String, Object> map) throws Exception;

	int getNickCheck(String nick) throws Exception;
	


}
package com.flee.admin.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminMemberService {

	List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception;  // 목록
	

	Map<String, Object> memberDetail(Map<String, Object> map) throws Exception;  //상세보기
		
	void memberDelete(Map<String, Object> map) throws Exception;  //삭제

	public int memberUpdate(Map<String, Object> map) throws Exception;
	
	public int rankUpdate(Map<String, Object> map) throws Exception;

	}

package com.flee.community.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface CommunityService {
	
	List<Map<String, Object>> communityList(Map<String, Object> map) throws Exception;  //커뮤니티 목록
	
	void communityWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;  //커뮤니티 입력

	Map<String, Object> communityDetail(Map<String, Object> map) throws Exception;  //커뮤니티 상세보기
	
	void communityDelete(Map<String, Object> map) throws Exception;  //커뮤니티 삭제

	void communityUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;

	

	}



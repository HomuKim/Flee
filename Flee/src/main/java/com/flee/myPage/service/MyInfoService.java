package com.flee.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MyInfoService {

	Map<String, Object> getMember(Map<String, Object> map) throws Exception;
	
	Map<String, Object> getCategory(Map<String, Object> map) throws Exception;
	
	void updateMember(Map<String, Object> map) throws Exception;
	
	void updateMemberCategory(Map<String, Object> map) throws Exception;
	
	void updateProfile(Map<String, Object> map) throws Exception;
	
	void deleteMember(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> getMyProductList(Map<String, Object> map) throws Exception;

}

  
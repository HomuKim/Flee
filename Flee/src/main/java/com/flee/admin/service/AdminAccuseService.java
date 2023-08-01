package com.flee.admin.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminAccuseService {

	List<Map<String, Object>> adminAList(Map<String, Object> map) throws Exception;  // 목록
	

	void adminAupdate(Map<String, Object> map) throws Exception; //변경 
	

	}

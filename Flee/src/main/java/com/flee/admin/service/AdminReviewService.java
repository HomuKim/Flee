package com.flee.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminReviewService {

	List<Map<String, Object>> adminRList(Map<String, Object> map) throws Exception;
	
	void adminRDelete(Map<String, Object> map) throws Exception;
	
	Map<String, Object> adminRDetail(Map<String, Object> map) throws Exception;
}

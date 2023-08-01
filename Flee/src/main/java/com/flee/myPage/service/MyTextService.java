package com.flee.myPage.service;

import java.util.List;
import java.util.Map;

public interface MyTextService {
	
	List<Map<String, Object>> getMyReview(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> getMyCommunity(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> getMyQna(Map<String, Object> map) throws Exception;
	
}

package com.flee.myPage.service;

import java.util.List;
import java.util.Map;

public interface MyChatService {
	
	List<Map<String, Object>> selectMyQnAList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectMyQnADetail(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMyQnAModifyForm(Map<String, Object> map) throws Exception;
	
	int myQnATotalList(Map<String,Object> map);
	
	void updateMyQnA(Map<String, Object> map) throws Exception;
	
	void deleteMyQnA(Map<String, Object> map) throws Exception;

}

package com.flee.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminExchangeService {
	
	List<Map<String, Object>> selectProductList(Map<String, Object> map) throws Exception; 
	
	List<Map<String, Object>> selectTradeList(Map<String, Object> map) throws Exception;
		
	void deleteProduct(Map<String, Object> map) throws Exception;
	
	void deleteTrade(Map<String, Object> map) throws Exception;	

	List<Map<String, Object>> getMessageList(Map<String, Object> map) throws Exception;
}

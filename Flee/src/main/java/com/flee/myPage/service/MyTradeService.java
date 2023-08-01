package com.flee.myPage.service;

import java.util.List;
import java.util.Map;

public interface MyTradeService {

	List<Map<String, Object>> getTradeIngList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> getTradeCompleteList(Map<String, Object> map) throws Exception;
	

	//int tradeIngListTotal(Map<String,Object> map) throws Exception;
	
	//int tradeCompleteListTotal(Map<String,Object> map) throws Exception;
	
	//void updateSelling(Map<String,Object> map) throws Exception;
	
	//void updateBuying(Map<String,Object> map) throws Exception;
	
	//void deleteTrade(String t_idx) throws Exception;
	
	//productUpdate
	
	//productDelete

}

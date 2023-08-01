package com.flee.trade.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TradeService {

	List<Map<String, Object>> tradeList(Map<String, Object> map) throws Exception;

	void tradeWrite(Map<String, Object> map) throws Exception;

	void tradeDelete(Map<String, Object> map) throws Exception;

	void tradeUpdate(Map<String, Object> map) throws Exception;

	



}

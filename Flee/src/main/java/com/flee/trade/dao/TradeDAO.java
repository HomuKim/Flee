package com.flee.trade.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("tradeDAO")
public class TradeDAO extends AbstractDAO {

	// 페이징
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> tradeList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("trade.tradeList", map);
	}

	public void tradeWrite(Map<String, Object> map) throws Exception {
		insert("trade.tradeWrite", map);
	}


	public void tradeUpdate(Map<String, Object> map) throws Exception {
		update("trade.tradeUpdate", map);
	}

	public void tradeDelete(Map<String, Object> map) throws Exception {
		delete("trade.tradeDelete", map);
	}

	// 나의 거래중 내역 리스트
	public List<Map<String, Object>> getTradeIngList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("trade.getTradeIngList", map);
	}

	// 나의 거래완료 내역 리스트
	public List<Map<String, Object>> getTradeCompleteList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("trade.getTradeCompleteList", map);
	}
	
	public Map<String, Object> getProductTradeIngList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("trade.getProductTradeIngList", map);
	}
}

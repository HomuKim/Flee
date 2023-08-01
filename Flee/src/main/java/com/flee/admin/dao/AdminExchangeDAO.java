package com.flee.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("adminExchangeDAO")
public class AdminExchangeDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProductList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("product.adminPList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTradeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("trade.adminTList", map);
	}
	
	public void deleteProduct(Map<String, Object> map) throws Exception {
		update("product.deleteProduct", map);
	}
	
	public void deleteTrade(Map<String, Object> map) throws Exception {
		delete("trade.tradeDelete", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getMessageList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("chat.getMessageList", map);
	}
	
}

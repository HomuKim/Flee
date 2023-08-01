package com.flee.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.flee.admin.dao.AdminExchangeDAO;

import lombok.AllArgsConstructor;

@Service("adminProductService")
@AllArgsConstructor
public class AdminExchangeServiceImpl implements AdminExchangeService {

	private AdminExchangeDAO adminExchangeDAO;

	@Override
	public List<Map<String, Object>> selectProductList(Map<String, Object> map) throws Exception {
		String[] typeArr = String.valueOf(map.get("type")).split("");
		map.put("typeArr", typeArr);
		return adminExchangeDAO.selectProductList(map);
	}

	@Override
	public List<Map<String, Object>> selectTradeList(Map<String, Object> map) throws Exception {		
		String[] typeArr = String.valueOf(map.get("type")).split("");
		map.put("typeArr", typeArr);
		return adminExchangeDAO.selectTradeList(map);
	}
	
	@Override
	public void deleteProduct(Map<String, Object> map) throws Exception {
		adminExchangeDAO.deleteProduct(map);
	}

	@Override
	public void deleteTrade(Map<String, Object> map) throws Exception {
		adminExchangeDAO.deleteTrade(map);
	}
	
	@Override
	public List<Map<String, Object>> getMessageList(Map<String, Object> map) throws Exception {
		return adminExchangeDAO.getMessageList(map);
	}

}

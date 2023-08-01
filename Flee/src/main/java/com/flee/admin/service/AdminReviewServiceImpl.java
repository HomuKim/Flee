package com.flee.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.flee.admin.dao.AdminReviewDAO;

import lombok.AllArgsConstructor;

@Service("adminRService")
@AllArgsConstructor
public class AdminReviewServiceImpl implements AdminReviewService {

	private AdminReviewDAO adminReviewDAO;
	
	@Override
	public List<Map<String, Object>> adminRList(Map<String, Object> map) throws Exception{
		String[] typeArr = String.valueOf(map.get("type")).split("");
		map.put("typeArr", typeArr);
		return adminReviewDAO.adminRList(map);
		
	}
	
	@Override
	public void adminRDelete(Map<String, Object> map)throws Exception{
		 adminReviewDAO.adminRDelete(map);
	}
	
	@Override
	public Map<String, Object> adminRDetail(Map<String, Object> map) throws Exception{
		return adminReviewDAO.adminRDetail(map);
	}
}

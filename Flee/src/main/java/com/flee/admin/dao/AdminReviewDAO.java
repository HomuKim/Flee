package com.flee.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("adminReviewDAO")
public class AdminReviewDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminRList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("admin.adminRList", map);
	}

	public void adminRDelete(Map<String, Object> map) throws Exception{
		update("admin.adminRDelete", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminRDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("admin.adminRDetail",map);
	}
}

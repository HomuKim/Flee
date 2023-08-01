package com.flee.community.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;



@Repository("communityDAO")
public class CommunityDAO extends AbstractDAO{

	//페이징
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> communityList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("community.communityList", map);
	}

	public void communityWrite(Map<String, Object> map) throws Exception{
		insert("community.communityWrite", map);
	}

	public void updateCcount(Map<String, Object> map) throws Exception{
		update("community.updateCcount", map);
	}

	
	//상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> communityDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("community.communityDetail", map);
	}

	public void communityUpdate(Map<String, Object> map) throws Exception{
		update("community.communityUpdate", map);
	}

	public void communityDelete(Map<String, Object> map) throws Exception{
		update("community.communityDelete", map);
	}

}




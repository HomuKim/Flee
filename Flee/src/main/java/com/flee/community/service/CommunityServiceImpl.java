package com.flee.community.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.flee.community.dao.CommunityDAO;

import lombok.AllArgsConstructor;

@Service("communityService")
@AllArgsConstructor
public class CommunityServiceImpl implements CommunityService {

	private CommunityDAO communityDAO;

	@Override
	public List<Map<String, Object>> communityList(Map<String, Object> map) throws Exception {
		String[] typeArr = String.valueOf(map.get("type")).split("");
		map.put("typeArr", typeArr);
		return communityDAO.communityList(map);
	}

	@Override
	public void communityWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		communityDAO.communityWrite(map);

	}

	@Override
	public Map<String, Object> communityDetail(Map<String, Object> map) throws Exception {
		communityDAO.updateCcount(map);

		return communityDAO.communityDetail(map);
	}

	@Override
	public void communityUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		communityDAO.communityUpdate(map);

	}

	@Override
	public void communityDelete(Map<String, Object> map) throws Exception {
		communityDAO.communityDelete(map);
	}

}

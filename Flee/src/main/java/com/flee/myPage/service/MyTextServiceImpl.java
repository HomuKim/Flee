package com.flee.myPage.service;

import java.util.List;

import java.util.Map;


import org.springframework.stereotype.Service;

import com.flee.myPage.dao.MyTextDAO;

import lombok.AllArgsConstructor;

@Service("myTextService")
@AllArgsConstructor
public class MyTextServiceImpl implements MyTextService {
	
	private MyTextDAO myTextDAO;

	@Override
	public List<Map<String, Object>> getMyReview(Map<String, Object> map) throws Exception {
		return myTextDAO.getMyReview(map);
	}

	@Override
	public List<Map<String, Object>> getMyCommunity(Map<String, Object> map) throws Exception {
		return myTextDAO.getMyCommunity(map);
	}

	@Override
	public List<Map<String, Object>> getMyQna(Map<String, Object> map) throws Exception {
		return myTextDAO.getMyQna(map);
	}

	
	

}

package com.flee.admin.service;

import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Service;

import com.flee.admin.dao.AdminAccuseDAO;

import lombok.AllArgsConstructor;

@Service("adminAccuseService")
@AllArgsConstructor
public class AdminAccuseServiceImpl implements AdminAccuseService {
	

	
	private AdminAccuseDAO adminAccuseDAO;
		
		@Override
		public List<Map<String, Object>> adminAList(Map<String, Object> map) throws Exception {
			String[] typeArr = String.valueOf(map.get("type")).split("");
			map.put("typeArr", typeArr);
			return adminAccuseDAO.adminAList(map);
		}



		@Override
		public void adminAupdate(Map<String, Object> map) throws Exception {
			adminAccuseDAO.adminAupdate(map);
		}
		

}
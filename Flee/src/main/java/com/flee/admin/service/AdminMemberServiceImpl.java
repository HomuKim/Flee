package com.flee.admin.service;

import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Service;

import com.flee.admin.dao.AdminMemberDAO;

import lombok.AllArgsConstructor;


@Service("adminMemberService")
@AllArgsConstructor
public class AdminMemberServiceImpl implements AdminMemberService {
	

	private AdminMemberDAO adminMemberDAO;
		
		@Override
		public List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception {
			String[] typeArr = String.valueOf(map.get("type")).split("");
			map.put("typeArr", typeArr);
			return adminMemberDAO.memberList(map);
		}

		
		@Override
		public Map<String, Object> memberDetail(Map<String, Object> map) throws Exception {
			return adminMemberDAO.memberDetail(map);
		}
		
	

		@Override
		public void memberDelete(Map<String, Object> map) throws Exception {
			adminMemberDAO.memberDelete(map);
		}


		@Override
		public int memberUpdate(Map<String, Object> map) throws Exception {
			return adminMemberDAO.memberUpdate(map);
		}

		
		@Override
		public int rankUpdate(Map<String, Object> map) throws Exception {
			return adminMemberDAO.rankUpdate(map);
		}
}
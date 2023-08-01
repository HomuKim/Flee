package com.flee.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

	@Repository("adminMemberDAO")
	public class AdminMemberDAO extends AbstractDAO{
		//페이징
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception{
			return (List<Map<String, Object>>)selectList("admin.memberList", map);
		}

		@SuppressWarnings("unchecked")
		public Map<String, Object> memberDetail(Map<String, Object> map) throws Exception{
			return (Map<String, Object>) selectOne("admin.memberDetail", map);
		}

		public int memberUpdate(Map<String, Object> map) throws Exception{
			return (int) update("admin.memberUpdate", map);
		}

		public void memberDelete(Map<String, Object> map) throws Exception{
			delete("admin.memberDelete", map);
		}
		
		public int rankUpdate(Map<String, Object> map) throws Exception{
			return (int) update("admin.rankUpdate", map);
		}

		

	}






package com.flee.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

	@Repository("adminAccuseDAO")
	public class AdminAccuseDAO extends AbstractDAO{
		//페이징
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> adminAList(Map<String, Object> map) throws Exception{
			return (List<Map<String, Object>>)selectList("accuse.adminAList", map);
		}

		
		public void adminAupdate(Map<String, Object> map) throws Exception{
			update("accuse.adminAupdate", map);
		}


	}






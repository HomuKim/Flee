package com.flee.jjim.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("jjimDAO")
public class JjimDAO extends AbstractDAO{

	public int write(Map<String, Object> map)throws Exception{
		return(int)insert("jjim.writeJjim", map);
	}
	
	public List<Map<String, Object>> getList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("jjim.getJjimList", map);
	}
	
	public int delete(Map<String, Object> map)throws Exception{
		return (int)delete("jjim.deleteJjim", map);
	}
	
	public Map<String, Object> getProductJjimList(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("jjim.getProductJjimList", map);
	}
}

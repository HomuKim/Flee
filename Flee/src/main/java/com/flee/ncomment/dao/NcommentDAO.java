package com.flee.ncomment.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("ncommentDAO")
public class NcommentDAO extends AbstractDAO{
	
	public int insert(Map<String, Object> map) throws Exception {
		return (int) insert("ncomment.writeComment", map);
	}
	
	public int update(Map<String, Object> map) throws Exception {
		return (int) update("ncomment.updateComment", map);
	}
	
	public int delete(int ncidx) throws Exception {
		return (int) delete("ncomment.deleteComment", ncidx);
	}
	
	public int getCount(int nidx) throws Exception{
		return (int) selectOne("ncomment.getCount", nidx);
	}

	public Map<String, Object> get(int ncidx) throws Exception{
		return (Map<String, Object>) selectOne("ncomment.getComment", ncidx);
	}
	
	public List<Map<String, Object>> getCommentList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("ncomment.getCommentList", map);
	}
}

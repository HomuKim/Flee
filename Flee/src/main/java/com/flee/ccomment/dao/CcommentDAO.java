package com.flee.ccomment.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("ccommentDAO")
public class CcommentDAO extends AbstractDAO {

	public int insert(Map<String, Object> map) throws Exception {
		return (int) insert("ccomment.writeComment", map);
	}

	public int update(Map<String, Object> map) throws Exception {
		return (int) update("ccomment.updateComment", map);
	}

	public int delete(int ccidx) throws Exception {
		return (int) delete("ccomment.deleteComment", ccidx);
	}

	public int getCount(int cidx) throws Exception {
		return (int) selectOne("ccomment.getCount", cidx);
	}

	public Map<String, Object> get(int ccidx) throws Exception {
		return (Map<String, Object>) selectOne("ccomment.getComment", ccidx);
	}

	public List<Map<String, Object>> getCommentList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("ccomment.getCommentList", map);
	}

	public int updateReStep(Map<String, Object> map) throws Exception {
		return (int) update("ccomment.updateReStep", map);
	}
}

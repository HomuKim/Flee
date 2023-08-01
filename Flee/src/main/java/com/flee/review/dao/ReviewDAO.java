package com.flee.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("ReviewDAO")
public class ReviewDAO extends AbstractDAO {

	public int insert(Map<String, Object> map) throws Exception {
		return (int) insert("review.writeReview", map);
	}

	public int update(Map<String, Object> map) throws Exception {
		return (int) update("review.updateReview", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReview(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("review.selectReview", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("review.selectReviewList", map);
	}

	public int delete(int R_IDX) throws Exception {
		return (int) delete("review.deleteReview", R_IDX);
	}
	
	public Map<String, Object> get(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("review.getReview", map);
	}
}

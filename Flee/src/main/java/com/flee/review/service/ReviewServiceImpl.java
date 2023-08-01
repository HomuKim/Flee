package com.flee.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flee.review.dao.ReviewDAO;

import lombok.AllArgsConstructor;

@Service("reviewService")
@AllArgsConstructor

public class ReviewServiceImpl implements ReviewService {

	private ReviewDAO ReviewDAO;

	@Override
	public int writeReview(Map<String, Object> map) throws Exception {
		return ReviewDAO.insert(map);
	}

	@Override
	public int updateReview(Map<String, Object> map) throws Exception {
		return ReviewDAO.update(map);
	}

	@Override
	public Map<String, Object> selectReview(Map<String, Object> map) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> tempMap = ReviewDAO.selectReview(map);
		resultMap.put("list", tempMap);
		if (tempMap.size() > 0) {
			resultMap.put("TOTAL", tempMap.get(0).get("TOTAL_COUNT"));
			resultMap.put("AVG", tempMap.get(0).get("AVG"));
		} else {
			resultMap.put("TOTAL", 0);
		}

		return resultMap;
	}

	@Override
	public Map<String, Object> selectReviewList(Map<String, Object> map) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> tempMap = ReviewDAO.selectReviewList(map);
		resultMap.put("list", tempMap);
		if (tempMap.size() > 0) {
			resultMap.put("TOTAL", tempMap.get(0).get("TOTAL_COUNT"));
		} else {
			resultMap.put("TOTAL", 0);
		}

		return resultMap;
	}

	@Override
	public int deleteReview(int R_IDX) throws Exception {
		return ReviewDAO.delete(R_IDX);
	}

//	@Override
//	public Map<String, Object> getReview(int ridx) throws Exception {
//		return ReviewDAO.get(ridx);
//	}

}

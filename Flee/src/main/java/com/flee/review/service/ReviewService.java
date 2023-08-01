package com.flee.review.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface ReviewService {

	public int writeReview(Map<String, Object> map) throws Exception;
	
	public int updateReview(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectReview(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> selectReviewList(Map<String, Object> map) throws Exception;
	
	public int deleteReview(int R_IDX) throws Exception;
	
//	public Map<String, Object> getReview(int ridx) throws Exception;

}

package com.flee.ccomment.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface CcommentService {

	public int writeComment(Map<String, Object> map) throws Exception;

	public int updateComment(Map<String, Object> map) throws Exception;

	public int deleteComment(int ccidx) throws Exception;
	
	public Map<String, Object> getComment(int ccidx) throws Exception;

	public List<Map<String, Object>> getCommentList(Map<String, Object> map) throws Exception;

}

package com.flee.ncomment.service;

import java.util.List;
import java.util.Map;

public interface NcommentService {

	public int writeComment(Map<String, Object> map) throws Exception;

	public int updateComment(Map<String, Object> map) throws Exception;

	public int deleteComment(int ncidx) throws Exception;

	public Map<String, Object> getComment(int ccidx) throws Exception;

	public List<Map<String, Object>> getCommentList(Map<String, Object> map) throws Exception;

}

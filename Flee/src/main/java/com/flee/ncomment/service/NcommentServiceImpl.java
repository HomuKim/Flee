package com.flee.ncomment.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.flee.ncomment.dao.NcommentDAO;

import lombok.AllArgsConstructor;

@Service("ncommentService")
@AllArgsConstructor
public class NcommentServiceImpl implements NcommentService{

	private NcommentDAO ncommentDAO;
	
	@Override
	public int writeComment(Map<String, Object> map) throws Exception {
		return ncommentDAO.insert(map);
	}

	@Override
	public int deleteComment(int ncidx) throws Exception {
		return ncommentDAO.delete(ncidx);
	}

	@Override
	public Map<String, Object> getComment(int ncidx) throws Exception {
		return ncommentDAO.get(ncidx);
	}

	@Override
	public int updateComment(Map<String, Object> map) throws Exception {
		return ncommentDAO.update(map);
	}

	@Override
	public List<Map<String, Object>> getCommentList(Map<String, Object> map) throws Exception {
		return ncommentDAO.getCommentList(map);
	}

}

package com.flee.ccomment.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flee.ccomment.dao.CcommentDAO;

import lombok.AllArgsConstructor;

@Service("ccommentService")
@AllArgsConstructor
public class CcommentServiceImpl implements CcommentService{

	private CcommentDAO ccommentDAO;
	
	@Transactional
	@Override
	public int writeComment(Map<String, Object> map) throws Exception {
		
		if (Integer.parseInt((String) map.get("REF"))!=0) {//답글 인경우
			ccommentDAO.updateReStep(map);
		}else {
			map.put("REF", ccommentDAO.getCount(Integer.parseInt((String) map.get("C_IDX")))+1);
		}
		return ccommentDAO.insert(map);
	}

	@Override
	public int deleteComment(int ccidx) throws Exception {
		return ccommentDAO.delete(ccidx);
	}

	@Override
	public Map<String, Object> getComment(int ccidx) throws Exception {
		return ccommentDAO.get(ccidx);
	}

	@Override
	public int updateComment(Map<String, Object> map) throws Exception {
		return ccommentDAO.update(map);
	}

	@Override
	public List<Map<String, Object>> getCommentList(Map<String, Object> map) throws Exception {
		return ccommentDAO.getCommentList(map);
	}

}

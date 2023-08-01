package com.flee.myPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.flee.common.dao.AbstractDAO;

@Repository("myTextDAO")
public class MyTextDAO extends AbstractDAO {
	
	//나의 Review
	public List<Map<String, Object>> getMyReview(Map<String, Object> map){
		return(List<Map<String, Object>>) selectList("myText.getMyReview", map);
	}
	
	public List<Map<String, Object>> getMyCommunity(Map<String, Object> map){
		return(List<Map<String, Object>>) selectList("myText.getMyCommunity", map);
	}
	
	public List<Map<String, Object>> getMyQna(Map<String, Object> map){
		return(List<Map<String, Object>>) selectList("myText.getMyQna", map);
	}
	
}
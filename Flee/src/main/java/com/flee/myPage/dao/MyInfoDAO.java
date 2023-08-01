package com.flee.myPage.dao;

import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;


@Repository("myInfoDAO")
public class MyInfoDAO extends AbstractDAO {
	
	//프로필 보기, 회원 정보 보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> getMember(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.getMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getCategory(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.getCategory", map);
	}
	//회원수정
	public void updateMemberCategory(Map<String, Object> map) throws Exception {
		update("member.updateMemberCategory",map);
	}
	
	public void updateMember(Map<String, Object> map) throws Exception {
		update("member.updateMember",map);
	}
	
	//프로필 수정
	public void updateProfile(Map<String, Object> map) throws Exception {
		update("member.updateProfile", map);
	}
	
	//회원 탈퇴
	public void deleteMember(Map<String, Object> map) throws Exception {
		delete("member.deleteMember", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myProductList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("product.myProductList", map);
	}
}

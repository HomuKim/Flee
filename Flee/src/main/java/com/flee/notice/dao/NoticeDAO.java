package com.flee.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO {

	// 공지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("notice.noticeList", map);
	}
	// QnA
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("notice.qnaList", map);
	}

	//회원 질문 작성하기
	public void qnaWrite(Map<String, Object> map) throws Exception {
		insert("notice.qnaWrite", map);
	}
		

	  public void updateNcount(Map<String, Object> map) throws Exception{
	  update("notice.updateNcount", map); 
	  }
	  	 
	  
	@SuppressWarnings("unchecked")
	public Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("notice.noticeDetail", map);
	}

	public void qnaUpdate(Map<String, Object> map) throws Exception {
		update("notice.qnaUpdate", map);
	}

	public void qnaDelete(Map<String, Object> map) throws Exception {
		update("notice.qnaDelete", map);
	}
	
	public void adminNoticeDelete(Map<String, Object> map) throws Exception {
		update("admin.adminNoticeDelete", map);
	}
	
	public List<Map<String, Object>> adminNoticeList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("admin.adminNoticeList", map);
	}

	
	//관리자 공지 수정
	public void adminNoticeUpdate(Map<String, Object> map) throws Exception {
		update("admin.adminNoticeUpdate", map);
	}

	
	//관리자 공지 작성
	public void noticeWrite(Map<String, Object> map) throws Exception {
		insert("admin.noticeWrite", map);
	}
}

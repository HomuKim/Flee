package com.flee.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.flee.notice.dao.NoticeDAO;

import lombok.AllArgsConstructor;

@Service("noticeService")
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{

	private NoticeDAO noticeDAO;
	
	
	//회원 공지 질문 목록 
	@Override
	public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception {
		return noticeDAO.noticeList(map);
	}
	
	//회원 공지 질문 목록 
		@Override
		public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
			String[] typeArr=String.valueOf(map.get("type")).split("");
		      map.put("typeArr", typeArr);
			
			return noticeDAO.qnaList(map);
		}

	//회원 공지상세 
	@Override
	public Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception {
		noticeDAO.updateNcount(map);
		
		return noticeDAO.noticeDetail(map);
	}
		

	//회원 질문 작성
	@Override
	public void qnaWrite(Map<String, Object> map) throws Exception {
		noticeDAO.qnaWrite(map);
	}
	
	//회원 질문 수정 
	@Override
	public void qnaUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception{
		noticeDAO.qnaUpdate(map);
		
	}
	
	//회원 질문 삭제
	@Override
	public void qnaDelete(Map<String, Object> map) throws Exception {
		noticeDAO.qnaDelete(map);
	}
	
	
	
	//관리자 공지 목록
	@Override
	public List<Map<String, Object>> adminNoticeList(Map<String, Object> map) throws Exception {
		return noticeDAO.adminNoticeList(map);
	}
	

	//관리자 공지 상세
	@Override
	public Map<String, Object> adminNoticeDetail(Map<String, Object> map) throws Exception {
		return noticeDAO.noticeDetail(map);
	}
	
	
	//관리 공지 삭제
	@Override
	public void adminNoticeDelete(Map<String, Object> map) throws Exception {
		noticeDAO.adminNoticeDelete(map);
		
	}

	//관리자 공지 수정폼
	@Override
	public void adminNoticeUpdate(Map<String, Object> map) throws Exception {
		noticeDAO.adminNoticeUpdate(map);
		
	}
	
	
	//관리자 공지 작성폼
	@Override
	public void noticeWrite(Map<String, Object> map) throws Exception {
		noticeDAO.noticeWrite(map);
	}
}

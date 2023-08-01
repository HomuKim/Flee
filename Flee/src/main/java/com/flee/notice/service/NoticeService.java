package com.flee.notice.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface NoticeService {
	
	List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception;  //목록
	
	List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception;  //목록
	
	void qnaWrite(Map<String, Object> map) throws Exception;//질문 입력

	Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception;  //상세보기(회원)
	
	
	void qnaDelete(Map<String, Object> map) throws Exception;  //질문삭제

	void qnaUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;  //질문수정
	
	List<Map<String, Object>> adminNoticeList(Map<String, Object> map) throws Exception;  //관리자 목록
	
	void adminNoticeDelete(Map<String, Object> map) throws Exception;  //관리자 공지 삭제

	void adminNoticeUpdate(Map<String, Object> map) throws Exception;  //관리자공지 수정

	void noticeWrite(Map<String, Object> map) throws Exception; //관리자 공지 입력

	Map<String, Object> adminNoticeDetail(Map<String, Object> map) throws Exception; //관리자 상세보기 
	


	}



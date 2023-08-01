package com.flee.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.flee.review.service.ReviewService;

import lombok.AllArgsConstructor;

@RequestMapping("/review/")
@RestController
@AllArgsConstructor
public class ReviewController {
	
	private ReviewService service;

	// 후기작성
	@RequestMapping(value = "/new", method = RequestMethod.POST, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> writeReview(@RequestBody Map<String, Object> map) throws Exception {

		int count = service.writeReview(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 후기수정
	@RequestMapping(value = "/update", method = RequestMethod.POST, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> update(@RequestBody Map<String, Object> map) throws Exception {
		int count = service.updateReview(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
//	//하나의 리뷰 가져오기
//	@RequestMapping(value = "/{ridx}", method = RequestMethod.GET, consumes = "application/json", produces = {
//			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
//	public ResponseEntity<Map<String, Object>> get(@PathVariable("ridx") int ridx) throws Exception {
//		return new ResponseEntity<Map<String, Object>>(service.getReview(ridx), HttpStatus.OK);
//	}

	// 내가 작성한 후기글
	@RequestMapping(value = "/my/{R_NICKNAME}/{page}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> get(@PathVariable("R_NICKNAME") String R_NICKNAME,
			@PathVariable("page") int page) throws Exception {
		int pageBlock = 10;// 한페이지에 보여줄 행의 수

		Map<String, Object> pagingMap = new HashMap<>();// 페이징에 필요한 변수저장
		pagingMap.put("START", ((page - 1) * pageBlock) - pageBlock + 1);
		pagingMap.put("END", page * pageBlock);
		pagingMap.put("R_NICKNAME", R_NICKNAME);
		return new ResponseEntity<Map<String, Object>>(service.selectReview(pagingMap), HttpStatus.OK);
	}

	// 내가 받은 후기글
	@RequestMapping(value = "/{RE_NICKNAME}/{page}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> get2(@PathVariable("RE_NICKNAME") String RE_NICKNAME,
			@PathVariable("page") int page) throws Exception {

		int pageBlock = 10;// 한페이지에 보여줄 행의 수

		Map<String, Object> pagingMap = new HashMap<>();// 페이징에 필요한 변수저장
		pagingMap.put("START", ((page - 1) * pageBlock) - pageBlock + 1);
		pagingMap.put("END", page * pageBlock);
		pagingMap.put("RE_NICKNAME", RE_NICKNAME);
		return new ResponseEntity<Map<String, Object>>(service.selectReviewList(pagingMap), HttpStatus.OK);
	}

	// 삭제
	@RequestMapping(value = "/{R_IDX}", method = RequestMethod.DELETE, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> delete(@PathVariable("R_IDX") int R_IDX) throws Exception {
		int count = service.deleteReview(R_IDX);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
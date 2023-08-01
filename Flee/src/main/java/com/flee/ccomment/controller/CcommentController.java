package com.flee.ccomment.controller;

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

import com.flee.ccomment.service.CcommentService;

import lombok.AllArgsConstructor;

@RequestMapping("/ccomment/")
@RestController
@AllArgsConstructor
public class CcommentController {

	private CcommentService service;

	@RequestMapping(value = "/new", method = RequestMethod.POST, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> write(@RequestBody Map<String, Object> map) throws Exception {
		int count = service.writeComment(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(value = "/update", method = { RequestMethod.PATCH,
			RequestMethod.PUT }, consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> update(@RequestBody Map<String, Object> map) throws Exception {
		int count = service.updateComment(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(value = "/{ccidx}", method = RequestMethod.DELETE, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> delete(@PathVariable("ccidx") int ccidx) throws Exception {
		int count = service.deleteComment(ccidx);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(value = "/{ccidx}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> get(@PathVariable("ccidx") int ccidx) throws Exception {
		return new ResponseEntity<Map<String, Object>>(service.getComment(ccidx), HttpStatus.OK);
	}

	@RequestMapping(value = "/pages/{cidx}/{page}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> getCommentList(@PathVariable("cidx") int cidx,
			@PathVariable("page") int page) throws Exception {

		Map<String, Object> resultMap = new HashMap<>();

		int pageBlock = 10;// 한페이지에 보여줄 행의 수

		Map<String, Object> pagingMap = new HashMap<>();// 페이징에 필요한 변수저장
		pagingMap.put("START", (page * pageBlock) - pageBlock + 1);
		pagingMap.put("END", page * pageBlock);
		pagingMap.put("C_IDX", cidx);
		List<Map<String, Object>> list = service.getCommentList(pagingMap);

		resultMap.put("list", list);
		if (list.size() > 0) {
			resultMap.put("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			resultMap.put("TOTAL", 0);
		}

		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
	}
}

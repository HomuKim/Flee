package com.flee.ncomment.controller;

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

import com.flee.ncomment.service.NcommentService;

import lombok.AllArgsConstructor;

@RequestMapping("/ncomment/")
@RestController
@AllArgsConstructor
public class NcommentController {

	private NcommentService service;

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

	@RequestMapping(value = "/{ncidx}", method = RequestMethod.DELETE, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> delete(@PathVariable("ncidx") int ncidx) throws Exception {
		int count = service.deleteComment(ncidx);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(value = "/{ncidx}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> get(@PathVariable("ncidx") int ncidx) throws Exception {
		return new ResponseEntity<Map<String, Object>>(service.getComment(ncidx), HttpStatus.OK);
	}

	@RequestMapping(value = "/list/{nidx}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<Map<String, Object>>> getCommentList(@PathVariable("nidx") int nidx) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("N_IDX", nidx);
		return new ResponseEntity<List<Map<String, Object>>>(service.getCommentList(map), HttpStatus.OK);
	}
}

package com.flee.admin.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.flee.admin.service.AdminMemberService;
import com.flee.ccomment.service.CcommentService;

import lombok.AllArgsConstructor;

@RequestMapping("/rank/")
@RestController
@AllArgsConstructor
public class AdminRankController {
	
	private AdminMemberService service;
	
	@RequestMapping(value = "/update", method = RequestMethod.PUT, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> update(@RequestBody Map<String, Object> map) throws Exception {
		int count = service.rankUpdate(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/blockUpdate", method = RequestMethod.PUT, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> blockUpdate(@RequestBody Map<String, Object> map) throws Exception {
		int count = service.memberUpdate(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}

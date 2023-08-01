package com.flee.accuse.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flee.accuse.service.AccuseService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AccuseController {

		private AccuseService accuseService;
		
		
		@RequestMapping(value = "/accusePut.fe", method = RequestMethod.POST, consumes = "application/json", produces = {
				MediaType.TEXT_PLAIN_VALUE })
		public ResponseEntity<String> write(@RequestBody Map<String, Object> map) throws Exception {
			int count = accuseService.writeAccuse(map);
			return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
					: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
}

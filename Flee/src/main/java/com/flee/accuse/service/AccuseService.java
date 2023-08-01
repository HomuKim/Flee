package com.flee.accuse.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface AccuseService {

	public int writeAccuse(Map<String, Object> map) throws Exception; 
	
}

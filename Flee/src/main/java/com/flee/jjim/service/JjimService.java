package com.flee.jjim.service;

import java.util.List;
import java.util.Map;

public interface JjimService {
	
	public int writeJjim(Map<String, Object> map)throws Exception;

	public List<Map<String, Object>> getJjimList(Map<String, Object> map)throws Exception;
	
	public int deleteJjim(Map<String, Object> map)throws Exception;
}

package com.flee.accuse.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.flee.accuse.dao.AccuseDAO;

import lombok.AllArgsConstructor;

@Service("accuseService")
@AllArgsConstructor
public class AccuseServiceImpl implements AccuseService {

	private AccuseDAO accuseDAO;
	
	@Override
	public int writeAccuse(Map<String, Object> map) throws Exception {
		return accuseDAO.WriteAccuse(map);
		
		
	}
}

package com.flee.accuse.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("accuseDAO")   
public class AccuseDAO extends AbstractDAO{

	
	public int WriteAccuse(Map<String, Object>map) throws Exception{
		return (int)insert("accuse.writeAccuse", map);
	}
	
}

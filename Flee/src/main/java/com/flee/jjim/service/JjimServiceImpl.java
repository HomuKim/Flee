package com.flee.jjim.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flee.jjim.dao.JjimDAO;
import com.flee.product.dao.ProductDAO;

import lombok.AllArgsConstructor;

@Service("jjimService")
@AllArgsConstructor
public class JjimServiceImpl implements JjimService {

	private JjimDAO jjimDAO;
	private ProductDAO productDAO;

	@Transactional
	@Override
	public int writeJjim(Map<String, Object> map) throws Exception {
		map.put("count", 1);
		productDAO.updateJjimCount(map);

		return jjimDAO.write(map);
	}

	@Override
	public List<Map<String, Object>> getJjimList(Map<String, Object> map) throws Exception {
		return jjimDAO.getList(map);
	}

	@Transactional
	@Override
	public int deleteJjim(Map<String, Object> map) throws Exception {
		map.put("count", -1);
		productDAO.updateJjimCount(map);
		
		return jjimDAO.delete(map);
	}

}

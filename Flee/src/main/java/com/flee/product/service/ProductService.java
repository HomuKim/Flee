package com.flee.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ProductService {

	List<Map<String, Object>> selectProductList(Map<String, Object> map) throws Exception;

	void writeProduct(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectProductDetail(Map<String, Object> map) throws Exception;

	void updateProduct(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteProduct(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectProduct(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMainAreaProductList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectMainCategoryProductList(Map<String, Object> map) throws Exception;
}

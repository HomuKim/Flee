package com.flee.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("productDAO")
public class ProductDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProductList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("product.selectProductList", map);
	}

	public void WriteProduct(Map<String, Object> map) throws Exception {
		insert("product.insertProduct", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("product.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectProductDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("product.selectProductDetail", map);
	}

	public void updateProduct(Map<String, Object> map) throws Exception {
		update("product.updateProduct", map);
	}

	public void deleteProduct(Map<String, Object> map) throws Exception {
		update("product.deleteProduct", map);
	}

	public int selectMaxPID() throws Exception{
		return (int)selectOne("product.selectMaxPID");
	}
	
	public void insertImage(Map<String, Object> map) throws Exception {
		insert("product.insertImage", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectImageList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("product.selectImageList", map);
	}
	
	public void deleteImageList(Map<String, Object> map) throws Exception{
		update("product.deleteImageList", map);
	}

	public void updateImage(Map<String, Object> map) throws Exception{
		update("product.updateImage", map);
	}

	public void updateJjimCount(Map<String, Object> map) throws Exception {
		update("product.updateJjimCount", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMainProductList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("product.selectMainProductList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMainAreaProductList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("product.selectMainAreaProductList", map);
	}
	
	public List<Map<String, Object>> selectMainCategoryProductList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("product.selectMainCategoryProductList", map);
	}
}

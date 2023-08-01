package com.flee.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flee.chat.dao.ChatDAO;
import com.flee.common.util.ImageUtils;
import com.flee.jjim.dao.JjimDAO;
import com.flee.myPage.dao.MyInfoDAO;
import com.flee.product.dao.ProductDAO;
import com.flee.trade.dao.TradeDAO;

import lombok.AllArgsConstructor;

@Service("productService")
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	private ProductDAO productDAO;
	private TradeDAO tradeDAO;
	private ChatDAO chatDAO;
	private JjimDAO jjimDAO;
	private MyInfoDAO myInfoDAO;
	private ImageUtils imageUtils;

	@Override
	public List<Map<String, Object>> selectProduct(Map<String, Object> map) throws Exception {
		return productDAO.selectMainProductList(map);
	}

	@Override
	public Map<String, Object> selectMainAreaProductList(Map<String, Object> map) throws Exception {
		Map<String, Object> map2 = new HashMap<>();
		if (map.get("EMAIL") == null) {
			map.put("P_AREA", "종로구");
			List<Map<String, Object>> list_area = productDAO.selectMainAreaProductList(map);
			map2.put("list_area", list_area);
			System.out.println(list_area);
		} else {
			Map<String, Object> myInfo = myInfoDAO.getMember(map);
			String address = (String) myInfo.get("ADDRESS1");
			String[] address1 = address.split(" ");
			String area = address1[1];
			map.put("P_AREA", area);

			List<Map<String, Object>> list_area = productDAO.selectMainAreaProductList(map);

			map2.put("AREA", area);
			map2.put("list_area", list_area);

		}

		return map2;
	}

	@Override
	public List<Map<String, Object>> selectMainCategoryProductList(Map<String, Object> map) throws Exception {
		Map<String, Object> myCat = myInfoDAO.getCategory(map);

		List<Integer> list = new ArrayList<>();

		if (Integer.parseInt(String.valueOf(myCat.get("FASHION"))) == 1) {
			list.add(1);
		}
		if (Integer.parseInt(String.valueOf(myCat.get("BEAUTY"))) == 1) {
			list.add(2);
		}
		if (Integer.parseInt(String.valueOf(myCat.get("ELECTRONIC"))) == 1) {
			list.add(3);
		}
		if (Integer.parseInt(String.valueOf(myCat.get("DRAWING"))) == 1) {
			list.add(4);
		}
		if (Integer.parseInt(String.valueOf(myCat.get("WORKOUT"))) == 1) {
			list.add(5);
		}
		if (Integer.parseInt(String.valueOf(myCat.get("STUDY"))) == 1) {
			list.add(6);
		}
		if (Integer.parseInt(String.valueOf(myCat.get("FILM"))) == 1) {
			list.add(7);
		}
		if (Integer.parseInt(String.valueOf(myCat.get("ANIMAL"))) == 1) {
			list.add(8);
		}
		map.put("list", list);

		return productDAO.selectMainCategoryProductList(map);
	}

	@Override
	public List<Map<String, Object>> selectProductList(Map<String, Object> map) throws Exception {
		String[] typeArr = String.valueOf(map.get("type")).split("");
		map.put("typeArr", typeArr);
		return productDAO.selectProductList(map);
	}

	@Override
	public void writeProduct(Map<String, Object> map, HttpServletRequest request) throws Exception {

		List<Map<String, Object>> list = imageUtils.parseInsertImageInfo(map, request);
		if (list.get(0).get("S_FILE_NAME") == null) {
			map.put("P_IMAGE", "default");
			map.put("P_ID", list.get(0).get("P_ID"));
			productDAO.WriteProduct(map);
		} else {
			for (int i = 0, size = list.size(); i < size; i++) {
				if (i == 0) {
					map.put("P_IMAGE", list.get(i).get("S_FILE_NAME"));
					map.put("P_ID", list.get(i).get("P_ID"));
					productDAO.WriteProduct(map);
				}
				productDAO.insertImage(list.get(i));
			}
		}
	}

	@Transactional
	@Override
	public Map<String, Object> selectProductDetail(Map<String, Object> map) throws Exception {
		productDAO.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String, Object>();
//		상품, 작성자 정보
		Map<String, Object> proMap = productDAO.selectProductDetail(map);
		resultMap.put("proMap", proMap);

//		상품 상세 이미지
		List<Map<String, Object>> iList = productDAO.selectImageList(map);
		resultMap.put("iList", iList);

//		채팅 내역
		List<Map<String, Object>> chatList = chatDAO.getChatList(map);
		for (int i = 0; i < chatList.size(); i++) {
			if (String.valueOf(chatList.get(i).get("CP_ID")).equals(String.valueOf(proMap.get("P_ID")))) { // 이 상품에 대한
																											// 채팅내역이 있으면
				resultMap.put("chat", true);
				break;
			} else { // 이 상품에 대한 채팅내역이 없으면
				resultMap.put("chat", false);
			}
		}

//		거래 내역
		Map<String, Object> trade = tradeDAO.getProductTradeIngList(map);
		if (trade != null) {
			resultMap.put("trade", true);
			resultMap.put("tidx", trade.get("T_IDX"));
		} else {
			resultMap.put("trade", false);
		}

//		찜 내역
		Map<String, Object> jjim = jjimDAO.getProductJjimList(map);
		if (jjim != null) {
			resultMap.put("jjim", true);
			resultMap.put("jidx", jjim.get("J_IDX"));
		} else {
			resultMap.put("jjim", false);
		}

		return resultMap;
	}

	@Override
	public void updateProduct(Map<String, Object> map, HttpServletRequest request) throws Exception {

		productDAO.deleteImageList(map);

		List<Map<String, Object>> list = imageUtils.parseUpdateImageInfo(map, request);

		Map<String, Object> tempMap = null;

		for (int i = 0, size = list.size(); i < size; i++) {
			tempMap = list.get(i);
			map.put("P_ID", tempMap.get("P_ID"));
			if (tempMap.get("MAIN") != null) {
				if (tempMap.get("MAIN").equals("Y")) {
					map.put("P_IMAGE", tempMap.get("S_FILE_NAME"));
				}
			}
			if (tempMap.get("IS_NEW").equals("Y")) {
				productDAO.insertImage(tempMap);
			} else {
				productDAO.updateImage(tempMap);
			}
		}
		productDAO.updateProduct(map);
	}

	@Override
	public void deleteProduct(Map<String, Object> map) throws Exception {
		productDAO.deleteProduct(map);
	}

}

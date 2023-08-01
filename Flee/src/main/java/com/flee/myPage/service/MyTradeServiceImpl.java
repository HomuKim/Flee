package com.flee.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.flee.myPage.dao.MyTradeDAO;
import com.flee.review.dao.ReviewDAO;

import lombok.AllArgsConstructor;

@Service("myTradeService")
@AllArgsConstructor
public class MyTradeServiceImpl implements MyTradeService {

	private MyTradeDAO myTradeDAO;
	private ReviewDAO reviewDAO;

	@Override
	public List<Map<String, Object>> getTradeIngList(Map<String, Object> map) throws Exception {
		return myTradeDAO.getTradeIngList(map);
	}

	@Override
	public List<Map<String, Object>> getTradeCompleteList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> list = myTradeDAO.getTradeCompleteList(map);
		for (Map<String, Object> tradeMap : list) {
			if (String.valueOf(map.get("M_NICKNAME")).equals(String.valueOf(tradeMap.get("TB_NICKNAME")))) {
				map.put("R_NICKNAME", tradeMap.get("TS_NICKNAME"));
				map.put("TP_ID", tradeMap.get("TP_ID"));
				Map<String, Object> review = reviewDAO.get(map);
				if (review != null) {
					tradeMap.put("review", false);
				} else {
					tradeMap.put("review", true);
				}
			} else {
				map.put("R_NICKNAME", tradeMap.get("TB_NICKNAME"));
				map.put("TP_ID", tradeMap.get("TP_ID"));
				Map<String, Object> review = reviewDAO.get(map);
				if (review != null) {
					tradeMap.put("review", false);
				} else {
					tradeMap.put("review", true);
				}
			}
		}

		return list;
	}

	/*
	 * @Override public int tradeIngListTotal(Map<String, Object> map) throws
	 * Exception { return myTradeDAO.tradeIngListTotal(map); }
	 * 
	 * @Override public int tradeCompleteListTotal(Map<String, Object> map) throws
	 * Exception { return myTradeDAO.tradeCompleteListTotal(map); }
	 * 
	 * @Override public void updateSelling(Map<String, Object> map) throws Exception
	 * { myTradeDAO.updateSelling(map); }
	 * 
	 * @Override public void updateBuying(Map<String, Object> map) throws Exception
	 * { myTradeDAO.updateBuying(map); }
	 * 
	 * @Override public void deleteTrade(String t_idx) throws Exception {
	 * myTradeDAO.deleteTrade(t_idx); }
	 */

}

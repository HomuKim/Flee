package com.flee.myPage.dao;

import java.util.List;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("myTradeDAO")
public class MyTradeDAO extends AbstractDAO {
	
	//나의 거래중 내역 리스트
	public List<Map<String, Object>> getTradeIngList(Map<String, Object> map) throws Exception {
		return(List<Map<String, Object>>) selectList("trade.getTradeIngList", map);
	}
	
	//나의 거래완료 내역 리스트
	public List<Map<String, Object>> getTradeCompleteList(Map<String, Object> map) throws Exception {
		return(List<Map<String, Object>>) selectList("trade.getTradeCompleteList", map);
	}
	
/*	//나의 거래중 내역 개수
	public int tradeIngListTotal(Map<String, Object> map) throws Exception {
		return (Integer) selectOne("trade.tradeIngListTotal", map);		
	}
	
	//나의 거래완료 내역 개수
	public int tradeCompleteListTotal(Map<String, Object> map) throws Exception {
		return (Integer) selectOne("trade.tradeCompleteListTotal", map);		
	}
		
	//구매거래 취소
	public void updateBuying(Map<String, Object> map) throws Exception {
		update("trade.updateBuying", map);
	}
	
	//판매거래 수락
	public void updateSelling(Map<String, Object> map) throws Exception {
		update("trade.updateSelling", map);
	}
		
	//거래내역 삭제
	public void deleteTrade(String t_idx) throws Exception {
		update("trade.deleteTrade", t_idx);
	}
	
	//거래(게시글) 수정
	//productUpdate
	
	//거래(게시글) 삭제
	//productDelete
*/
}

package com.flee.myPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flee.common.dao.AbstractDAO;

@Repository("myChatDAO")
public class MyChatDAO extends AbstractDAO {
	
	//나의 채팅 리스트
	
	//채팅 하나 선택
	
	//채팅 입력
	
	
	
	//나의 주문내역
	public List<Map<String, Object>> selectMyChatList(Map<String, Object> map) throws Exception{
		return(List<Map<String, Object>>) selectList("myPage.selectMyOrderList", map);
	}
	//나의정보
	public Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception{
		return(Map<String, Object>) selectOne("myPage.selectMyInfo", map);
	}
	//나의주문총개수
	public int orderTotalList(Map<String, Object> map) throws Exception{
		return  (Integer) selectOne("myPage.orderTotalList", map);		
	}
	public void deliveryUpdate(Map<String, Object> map) throws Exception{
		update("myPage.deliveryUpdate", map);
	}
	

}

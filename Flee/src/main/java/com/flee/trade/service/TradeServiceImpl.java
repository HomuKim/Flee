package com.flee.trade.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.flee.trade.dao.TradeDAO;

import lombok.AllArgsConstructor;


@Service("tradeService")
@AllArgsConstructor
public class TradeServiceImpl implements TradeService {
	private TradeDAO tradeDAO;

	@Override
	public List<Map<String, Object>> tradeList(Map<String, Object> map) throws Exception {
		return tradeDAO.tradeList(map);

	}

	@Override
	public void tradeWrite(Map<String, Object> map) throws Exception {

		tradeDAO.tradeWrite(map);
		}

	@Override
	public void tradeUpdate(Map<String, Object> map) throws Exception {
		tradeDAO.tradeUpdate(map);

	}

	@Override
	public void tradeDelete(Map<String, Object> map) throws Exception {
		tradeDAO.tradeDelete(map);
	}

}


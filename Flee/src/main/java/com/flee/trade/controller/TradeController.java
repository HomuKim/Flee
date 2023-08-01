package com.flee.trade.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flee.common.CommandMap;
import com.flee.trade.service.TradeService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class TradeController {

	private TradeService tradeService;
	

	@RequestMapping(value = "/tradeList.fe")
	public ModelAndView tradeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("trade/tradeList");

		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));

		int pageBlock = 10;// 한페이지에 보여줄 행의 수
		commandMap.put("START", (page * pageBlock) - pageBlock + 1);
		commandMap.put("END", page * pageBlock);

		List<Map<String, Object>> list = tradeService.tradeList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}

	// 작성 버튼 누르면 리스트로 넘어감
	@RequestMapping(value = "/tradeWrite.fe")
	public ModelAndView tradeWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/productDetail.fe");
		tradeService.tradeWrite(commandMap.getMap());
		mv.addObject("M_NICKNAME", commandMap.get("M_NICKNAME"));
		mv.addObject("P_ID", commandMap.get("TP_ID"));

		return mv;
	}

	@RequestMapping(value = "/tradeUpdate.fe")
	public ModelAndView tradeUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/myTrade.fe");

		tradeService.tradeUpdate(commandMap.getMap());
		mv.addObject("M_NICKNAME", commandMap.get("M_NICKNAME"));
		mv.addObject("check", true);

		return mv;
	}

	// 삭제버튼 눌렀을 때 (게시판 목록으로 넘어감)
	@RequestMapping(value = "/tradeDelete.fe")
	public ModelAndView tradeDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/myTrade.fe");

		tradeService.tradeDelete(commandMap.getMap());
		mv.addObject("M_NICKNAME", commandMap.get("M_NICKNAME"));

		return mv;
	}
}
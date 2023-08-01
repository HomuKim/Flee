package com.flee.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flee.admin.service.AdminExchangeService;
import com.flee.common.CommandMap;
import com.flee.common.util.ProductPaging;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AdminExchangeController {

	private AdminExchangeService adminExchangeService;

//  관리자 상품 페이지
//	http://localhost:8000/Flee/adminProductList.fe
	@RequestMapping(value = "/adminProductList.fe")
	public ModelAndView openProductList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/productList");

		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 10;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int totalProduct = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String subUrl = ""; // 조건 값 URL
		String url = "adminProductList.fe"; // 메인 URL

		// 검색 입력시 URL
		String searchUrl = "&type=" + commandMap.get("type") + "&keyword=" + commandMap.get("keyword");

		commandMap.put("START", start);
		commandMap.put("END", end);

		// FILTER 값이 null 일때 P_ID 추가
		if (commandMap.get("FILTER") == null) {
			commandMap.put("FILTER", "P_ID");
		}

		// type 값이 null이면 검색 URL 비우기
		if (commandMap.get("type") == null) {
			searchUrl = "";
		}
		if (commandMap.get("P_ITEM") != null) {
			subUrl += "&P_ITEM=" + commandMap.get("P_ITEM");
		}
		if (commandMap.get("P_SELLBUY") != null) {
			subUrl += "&P_SELLBUY=" + commandMap.get("P_SELLBUY");
		}
		if (commandMap.get("P_AREA") != null) {
			subUrl += "&P_AREA=" + commandMap.get("P_AREA");
		}

		List<Map<String, Object>> list = adminExchangeService.selectProductList(commandMap.getMap());

		if (list.size() > 0) {
			totalProduct = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));
		}

		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		ProductPaging paging = new ProductPaging(totalProduct, pageBlock, pageSize, page, url, subUrl, searchUrl);

		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("page", page);

		return mv;
	}

	// 상품게시판 페이지
	@RequestMapping(value = "/adminTradeList.fe")
	public ModelAndView openTradeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/tradeList");

		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 10;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int totalProduct = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String subUrl = "";
		String url = "adminTradeList.fe";

		String searchUrl = "&type="+commandMap.get("type")+"&keyword="+commandMap.get("keyword");

		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> list = adminExchangeService.selectTradeList(commandMap.getMap());

		if (list.size() > 0) {
			totalProduct = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));
		}

		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		ProductPaging paging = new ProductPaging(totalProduct, pageBlock, pageSize, page, url, subUrl, searchUrl);
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("page", page);

		return mv;
	}

	@RequestMapping(value = "/adminProductDelete.fe")
	public ModelAndView deleteProduct(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminProductList.fe");

		adminExchangeService.deleteProduct(commandMap.getMap());

		return mv;
	}

	@RequestMapping(value = "/adminTradeDelete.fe")
	public ModelAndView deleteTrade(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminTradeList.fe");

		adminExchangeService.deleteTrade(commandMap.getMap());

		return mv;
	}
	
	@RequestMapping(value = "/adminChatLog.fe")
	public ModelAndView chatLog(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/chatLog");
		
		int croomidx=Integer.parseInt(String.valueOf(commandMap.get("CROOM_IDX")));

		List<Map<String, Object>> list = adminExchangeService.getMessageList(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
}

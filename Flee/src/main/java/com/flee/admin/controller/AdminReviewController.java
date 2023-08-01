package com.flee.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flee.admin.service.AdminReviewService;
import com.flee.common.CommandMap;
import com.flee.common.util.Paging;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AdminReviewController {

	private AdminReviewService adminReviewService;

	@RequestMapping(value="/adminReview.fe")
	public ModelAndView adminRList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminReview");
		
		/* 페이징을 위한 변수 */		
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 10;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int ReviewListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "adminReview.fe";
		String searchUrl = "&type=" + commandMap.get("type") + "&keyword=" + commandMap.get("keyword");

		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> list = adminReviewService.adminRList(commandMap.getMap());

		if (list.size() > 0) {
			ReviewListCount = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));
		}

		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		Paging paging = new Paging(ReviewListCount, pageBlock, pageSize, page, url, searchUrl);

		mv.addObject("list", list);
		mv.addObject("paging", paging);

		return mv;
	}
	
	@RequestMapping(value="/adminRDetail.fe")
	public ModelAndView adminRDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminRDetail");

		Map<String, Object> map = adminReviewService.adminRDetail(commandMap.getMap());

		mv.addObject("map", map);
		
		return mv;
	}
	
	// 삭제버튼 눌렀을 때 (게시판 목록으로 넘어감)
	@RequestMapping(value = "/adminDelete.fe")
	public ModelAndView adminDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminReview.fe");

		adminReviewService.adminRDelete(commandMap.getMap());

		return mv;
	}
	
}

package com.flee.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flee.common.CommandMap;
import com.flee.common.util.Paging;
import com.flee.admin.service.AdminAccuseService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AdminAccuseController {
	private AdminAccuseService adminAccuseService;

	//http://localhost:8000/Flee/adminAList.fe?page=1
	//http://localhost:8000/Flee/adminAList.fe?page=1&ACU_NICKNAME=길동이
	//http://localhost:8000/Flee/adminAList.fe?page=1&A_NICKNAME=길동이
	@RequestMapping(value = "/adminAList.fe") 
	public ModelAndView adminAList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminAList");

		/* 페이징을 위한 변수 */
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 10;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int adminAListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "adminAList.fe";
		String searchUrl = "&type="+commandMap.get("type")+"&keyword="+commandMap.get("keyword");

		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> list = adminAccuseService.adminAList(commandMap.getMap());

		if (list.size() > 0) {
			adminAListCount = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));
		}

		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		Paging paging = new Paging(adminAListCount, pageBlock, pageSize, page, url, searchUrl);

		mv.addObject("list", list);
		mv.addObject("paging", paging);
		return mv;
	}

	@RequestMapping(value = "/adminAupdate.fe")
	public ModelAndView adminAupdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminAList.fe");

		adminAccuseService.adminAupdate(commandMap.getMap());

		return mv;
	}
}

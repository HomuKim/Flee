package com.flee.community.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flee.common.CommandMap;
import com.flee.common.util.Paging;
import com.flee.community.service.CommunityService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class CommunityController {

	private CommunityService communityService;

	@RequestMapping(value = "/communityList.fe")
	public ModelAndView communityList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("community/communityList");

		/* 페이징을 위한 변수 */
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 10;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int communityListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "communityList.fe";
		String searchUrl = "&type="+commandMap.get("type")+"&keyword="+commandMap.get("keyword");

		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> list = communityService.communityList(commandMap.getMap());

		if (list.size() > 0) {
			communityListCount = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));
		}

		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		Paging paging = new Paging(communityListCount, pageBlock, pageSize, page, url, searchUrl);

		mv.addObject("list", list);
		mv.addObject("paging", paging);
		return mv;
	}

	// 게시판 입력폼
	@RequestMapping(value = "/openCommunityWrite.fe")
	public ModelAndView openCommunityWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("community/communityWrite");

		return mv;
	}

	// 게시판 작성 버튼 눌렀을 때 (게시판 목록으로 넘어감)
	@RequestMapping(value = "/communityWrite.fe")
	public ModelAndView communityWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/communityList.fe");

		communityService.communityWrite(commandMap.getMap(), request);

		return mv;
	}

	@RequestMapping(value = "/communityDetail.fe") // http://localhost:8000/Flee/communityDetail.fe?C_IDX=3
	public ModelAndView openCommunityDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("community/communityDetail");

		Map<String, Object> map = communityService.communityDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/communityUpdate.fe")
	public ModelAndView communityUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/communityDetail.fe");

		communityService.communityUpdate(commandMap.getMap(), request);

		mv.addObject("C_IDX", commandMap.get("C_IDX"));
		return mv;
	}
	
	// 삭제버튼 눌렀을 때 (게시판 목록으로 넘어감)
	@RequestMapping(value = "/communityDelete.fe")
	public ModelAndView communityDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/communityList.fe");

		communityService.communityDelete(commandMap.getMap());

		return mv;
	}
}
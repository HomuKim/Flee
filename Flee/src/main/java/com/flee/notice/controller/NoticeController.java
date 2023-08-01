package com.flee.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flee.common.CommandMap;
import com.flee.common.util.Paging;
import com.flee.notice.service.NoticeService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class NoticeController {
	private NoticeService noticeService;

	@RequestMapping(value = "/noticeList.fe")
	public ModelAndView noticeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("notice/noticeList");

		/* 페이징을 위한 변수 */
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 7;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int NoticeListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "noticeList.fe";
		String searchUrl = "";
		
		commandMap.put("START", 1);
		commandMap.put("END", 3);

		List<Map<String, Object>> nlist = noticeService.noticeList(commandMap.getMap());

		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> qlist = noticeService.qnaList(commandMap.getMap());

		if (qlist.size() > 0) {
			NoticeListCount = Integer.parseInt(String.valueOf(qlist.get(0).get("TOTAL_COUNT")));
		}
		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		Paging paging = new Paging(NoticeListCount, pageBlock, pageSize, page, url, searchUrl);

		mv.addObject("qlist", qlist);
		mv.addObject("nlist", nlist);
		mv.addObject("paging", paging);
		return mv;
	}

	// 회원 질문 작성폼
	@RequestMapping(value = "/openQnaWrite.fe")
	public ModelAndView openQnaWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("notice/qnaWrite");

		return mv;
	}
	

	@RequestMapping(value="/qnaWrite.fe")
	public ModelAndView qnaWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/noticeList.fe");
		
		noticeService.qnaWrite(commandMap.getMap());
		
		return mv;
	}
	
	

	@RequestMapping(value = "/noticeDetail.fe") // http://localhost:8000/Flee/noticeDetail.fe?N_IDX=6
	public ModelAndView noticeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("notice/noticeDetail");
		
		Map<String, Object> map = noticeService.noticeDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/openQnaUpdate.fe") // http://localhost:8000/Flee/openQnaUpdate.fe?N_IDX=6
	public ModelAndView openQnaUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("notice/qnaUpdate");

		Map<String, Object> map = noticeService.noticeDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		return mv;
	}

	@RequestMapping(value = "/qnaUpdate.fe")
	public ModelAndView qnaUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/noticeDetail.fe");

		noticeService.qnaUpdate(commandMap.getMap(), request);

		mv.addObject("N_IDX", commandMap.get("N_IDX"));
		return mv;
	}
	
	

	// 삭제버튼 눌렀을 때 (공지 목록으로 넘어감)
	@RequestMapping(value = "/qnaDelete.fe")
	public ModelAndView qnaDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/noticeList.fe");

		noticeService.qnaDelete(commandMap.getMap());

		return mv;
	}

}
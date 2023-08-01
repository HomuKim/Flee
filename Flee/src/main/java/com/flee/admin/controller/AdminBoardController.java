package com.flee.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flee.admin.service.AdminMemberService;
import com.flee.common.CommandMap;
import com.flee.common.util.Paging;
import com.flee.community.service.CommunityService;
import com.flee.myPage.service.MyTextService;
import com.flee.notice.service.NoticeService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class AdminBoardController {

	private NoticeService noticeService;
	private CommunityService communityService;

	@RequestMapping(value = "/adminCommunityList.fe")
	public ModelAndView adminCommunityList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/communityList");

		/* 페이징을 위한 변수 */
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 10;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int communityListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "adminCommunityList.fe";
		String searchUrl = "&type=" + commandMap.get("type") + "&keyword=" + commandMap.get("keyword");

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

	@RequestMapping(value = "/adminNoticeList.fe")
	public ModelAndView noticeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminNoticeList");

		/* 페이징을 위한 변수 */
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 7;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int NoticeListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "adminNoticeList.fe";
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

	// 관리자 공지 상세보기
	@RequestMapping(value = "/adminNoticeDetail.fe")
	public ModelAndView adminNoticeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/noticeDetail");

		Map<String, Object> map = noticeService.adminNoticeDetail(commandMap.getMap());

		mv.addObject("map", map);

		return mv;
	}


	// 관리자 공지 수정
	@RequestMapping(value = "/noticeUpdate.fe")
	public ModelAndView noticeUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminNoticeDetail.fe");

		noticeService.adminNoticeUpdate(commandMap.getMap());

		mv.addObject("N_IDX", commandMap.get("N_IDX"));
		return mv;
	}

	// 관리자 공지 작성폼
	@RequestMapping(value = "/openNoticeWrite.fe")
	public ModelAndView openNoticeWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/noticeWrite");

		return mv;
	}

	// 관리자 공지 작성
	@RequestMapping(value = "/noticeWrite.fe")
	public ModelAndView noticeWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminNoticeList.fe");

		noticeService.noticeWrite(commandMap.getMap());

		return mv;
	}

	// 관리자 삭제버튼 눌렀을 때 (관리자 목록으로 넘어감)
	@RequestMapping(value = "/adminNoticeDelete.fe")
	public ModelAndView adminNoticeDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminNoticeList.fe");

		noticeService.adminNoticeDelete(commandMap.getMap());

		return mv;
	}
	
	@RequestMapping(value = "/adminCommunityDetail.fe") 
	public ModelAndView adminCommunityDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/communityDetail");

		Map<String, Object> map = communityService.communityDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}
	
	@RequestMapping(value = "/adminCommunityDelete.fe")
	public ModelAndView adminCommunityDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminCommunityList.fe");

		communityService.communityDelete(commandMap.getMap());

		return mv;
	}

}

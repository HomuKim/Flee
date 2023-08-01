package com.flee.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flee.common.CommandMap;
import com.flee.common.util.Paging;
import com.flee.common.util.ProductPaging;
import com.flee.common.util.cPaging;
import com.flee.common.util.qPaging;
import com.flee.common.util.rPaging;
import com.flee.myPage.service.MyInfoService;
import com.flee.myPage.service.MyTextService;
import com.flee.admin.service.AdminMemberService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AdminMemberController {

	private AdminMemberService adminMemberService;
	private MyTextService myTextService;
	private MyInfoService myInfoService;

	// 관리자 페이지 메인
	@RequestMapping(value = "/adminMain.fe")
	public ModelAndView adminMain(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminMain");

		return mv;
	}

	// 회원리스트
	@RequestMapping(value = "/memberList.fe")
	public ModelAndView memberList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/memberList");
		/* 페이징을 위한 변수 */
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 10;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int memberListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String subUrl = ""; // 조건 값 URL
		String url = "memberList.fe";
		String searchUrl = "&type=" + commandMap.get("type") + "&keyword=" + commandMap.get("keyword");

		commandMap.put("START", start);
		commandMap.put("END", end);

		if (commandMap.get("type") == null) {
			searchUrl = "";
		}
		if (commandMap.get("AREA") != null) {
			subUrl += "&AREA=" + commandMap.get("AREA");
		}
		if (commandMap.get("RANK") != null) {
			subUrl += "&RANK=" + commandMap.get("RANK");
		}

		List<Map<String, Object>> list = adminMemberService.memberList(commandMap.getMap());

		if (list.size() > 0) {
			memberListCount = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));
		}

		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		ProductPaging paging = new ProductPaging(memberListCount, pageBlock, pageSize, page, url, subUrl, searchUrl);

		mv.addObject("list", list);
		mv.addObject("paging", paging);

		return mv;
	}

	// 회원정보 상세
	@RequestMapping(value = "/memberDetail.fe")
	public ModelAndView memberDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/memberDetail");

		Map<String, Object> map = adminMemberService.memberDetail(commandMap.getMap());
		
		int rpage = commandMap.get("rpage") == null ? 1 : Integer.parseInt((String) commandMap.get("rpage"));// 현재 페이지
		int cpage = commandMap.get("cpage") == null ? 1 : Integer.parseInt((String) commandMap.get("cpage"));// 현재 페이지
		int qpage = commandMap.get("qpage") == null ? 1 : Integer.parseInt((String) commandMap.get("qpage"));// 현재 페이지
		int pageSize = 10;// 한 페이지에 보여줄 행의 수
		int rstart = (rpage * pageSize) - pageSize + 1;
		int rend = rpage * pageSize;
		int cstart = (cpage * pageSize) - pageSize + 1;
		int cend = cpage * pageSize;
		int qstart = (qpage * pageSize) - pageSize + 1;
		int qend = qpage * pageSize;
		int reviewListCount = 0; // 전체 게시글 수
		int communityListCount = 0; // 전체 게시글 수
		int qnaListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수

		String url = "memberDetail.fe?M_NICKNAME=" + commandMap.get("M_NICKNAME");
		String searchUrl = "";

		commandMap.put("RSTART", rstart);
		commandMap.put("REND", rend);
		commandMap.put("CSTART", cstart);
		commandMap.put("CEND", cend);
		commandMap.put("QSTART", qstart);
		commandMap.put("QEND", qend);

		List<Map<String, Object>> myReview = myTextService.getMyReview(commandMap.getMap());
		List<Map<String, Object>> myCommunity = myTextService.getMyCommunity(commandMap.getMap());
		List<Map<String, Object>> myQna = myTextService.getMyQna(commandMap.getMap());

		if (myReview.size() > 0) {
			reviewListCount = Integer.parseInt(String.valueOf(myReview.get(0).get("TOTAL_COUNT")));
		}

		if (myCommunity.size() > 0) {
			communityListCount = Integer.parseInt(String.valueOf(myCommunity.get(0).get("TOTAL_COUNT")));
		}

		if (myQna.size() > 0) {
			qnaListCount = Integer.parseInt(String.valueOf(myQna.get(0).get("TOTAL_COUNT")));
		}

		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		rPaging rPaging = new rPaging(reviewListCount, pageBlock, pageSize, rpage, url, searchUrl);
		cPaging cPaging = new cPaging(communityListCount, pageBlock, pageSize, cpage, url, searchUrl);
		qPaging qPaging = new qPaging(qnaListCount, pageBlock, pageSize, qpage, url, searchUrl);

		mv.addObject("myReview", myReview);
		mv.addObject("myCommunity", myCommunity);
		mv.addObject("myQna", myQna);
		mv.addObject("rPaging", rPaging);
		mv.addObject("cPaging", cPaging);
		mv.addObject("qPaging", qPaging);
		mv.addObject("map", map);
		return mv;
	}

	// 회원정보 수정 완료
	@RequestMapping(value = "/memberUpdate.fe")
	public ModelAndView memberUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/memberDetail.fe");

		adminMemberService.memberUpdate(commandMap.getMap());
		mv.addObject("M_NICKNAME", commandMap.get("M_NICKNAME"));

		return mv;
	}

	// 삭제버튼 눌렀을 때 ( 목록으로 넘어감)
	@RequestMapping(value = "/memberDelete.fe")
	public ModelAndView memberDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/memberList.fe");

		adminMemberService.memberDelete(commandMap.getMap());

		return mv;
	}

}
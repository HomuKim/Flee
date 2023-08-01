package com.flee.myPage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flee.common.CommandMap;
import com.flee.common.util.cPaging;
import com.flee.common.util.qPaging;
import com.flee.common.util.rPaging;
import com.flee.myPage.service.MyInfoService;
import com.flee.myPage.service.MyTextService;
import com.flee.myPage.service.MyTradeService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MyInfoController {

	private MyInfoService myInfoService;
	private MyTextService myTextService;
	private MyTradeService myTradeService;

	@RequestMapping(value = "/myPage.fe")
	public ModelAndView main(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("myPage/myPageMain");

		HttpSession session = request.getSession();
		String EMAIL = String.valueOf(session.getAttribute("EMAIL"));
		commandMap.put("EMAIL", EMAIL);

		Map<String, Object> map = myInfoService.getMember(commandMap.getMap());
		mv.addObject("myInfo", map);

		return mv;
	}

	/// 회원정보수정폼(myInfoUpdateForm)
	@RequestMapping(value = "/myInfoUpdateForm.fe")
	public ModelAndView myInfoUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("myPage/myInfoUpdateForm");

		Map<String, Object> map = myInfoService.getMember(commandMap.getMap());
		Map<String, Object> catmap = myInfoService.getCategory(commandMap.getMap());

		mv.addObject("myInfo", map);
		mv.addObject("myCat", catmap);

		return mv;
	}

	/// 회원정보수정(MyInfoUpdate)
	@RequestMapping(value = "myInfoUpdate.fe", method = RequestMethod.POST)
	public ModelAndView myInfoUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/myPage.fe");

		myInfoService.updateMember(commandMap.getMap());

		Map<String, Object> map = new HashMap<>();
		map.put("FASHION", commandMap.getMap().get("FASHION"));
		map.put("BEAUTY", commandMap.getMap().get("BEAUTY"));
		map.put("ELECTRONIC", commandMap.getMap().get("ELECTRONIC"));
		map.put("DRAWING", commandMap.getMap().get("DRAWING"));
		map.put("WORKOUT", commandMap.getMap().get("WORKOUT"));
		map.put("STUDY", commandMap.getMap().get("STUDY"));
		map.put("FILM", commandMap.getMap().get("FILM"));
		map.put("ANIMAL", commandMap.getMap().get("ANIMAL"));
		map.put("M_NICKNAME", commandMap.getMap().get("M_NICKNAME"));

		myInfoService.updateMemberCategory(map);

		return mv;
	}

	/// 회원탈퇴(MyInfoDelete)
	@RequestMapping(value = "/myInfoDelete.fe")
	public ModelAndView myInfoDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/main.fe");

		myInfoService.deleteMember(commandMap.getMap());

		HttpSession session = request.getSession();
		if (session != null)
			session.invalidate();

		return mv;
	}

//	내가 쓴글
	@RequestMapping(value = "/myText.fe")
	public ModelAndView myTextList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("myPage/myText");

		int rpage = commandMap.get("rpage") == null ? 1 : Integer.parseInt((String) commandMap.get("rpage"));// 현재 페이지
		int cpage = commandMap.get("cpage") == null ? 1 : Integer.parseInt((String) commandMap.get("cpage"));// 현재 페이지
		int qpage = commandMap.get("qpage") == null ? 1 : Integer.parseInt((String) commandMap.get("qpage"));// 현재 페이지
		int pageSize = 5;// 한 페이지에 보여줄 행의 수
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

		String url = "myText.fe?M_NICKNAME=" + commandMap.get("M_NICKNAME");
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

		return mv;
	}

//	내 거래내역
	@RequestMapping(value = "/myTrade.fe")
	public ModelAndView myTrade(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("myPage/myTrade");

		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));

		int pageBlock = 10;// 한페이지에 보여줄 행의 수
		commandMap.put("START", (page * pageBlock) - pageBlock + 1);
		commandMap.put("END", page * pageBlock);

		List<Map<String, Object>> list = myTradeService.getTradeIngList(commandMap.getMap());
		List<Map<String, Object>> list2 = myTradeService.getTradeCompleteList(commandMap.getMap());
		mv.addObject("trading", list);
		mv.addObject("completed", list2);
		mv.addObject("M_NICKNAME", commandMap.get("M_NICKNAME"));
		return mv;
	}

}

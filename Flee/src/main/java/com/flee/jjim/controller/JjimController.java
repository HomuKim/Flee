package com.flee.jjim.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flee.common.CommandMap;
import com.flee.common.util.ProductPaging;
import com.flee.jjim.service.JjimService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class JjimController {

	private JjimService jjimService;

	@RequestMapping(value = "/jjimWrite.fe", method = RequestMethod.POST, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> write(@RequestBody Map<String, Object> map) throws Exception {
		int count = jjimService.writeJjim(map);
		String jidx = String.valueOf(map.get("J_IDX"));
		return count == 1 ? new ResponseEntity<String>(jidx, HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	   @RequestMapping("/jjimList.fe")
	   public ModelAndView jjimList(CommandMap commandMap) throws Exception {
	      ModelAndView mv = new ModelAndView("jjim/jjimList");

	      /* 페이징을 위한 변수 */
	      int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
	      int pageSize = 4;// 한 페이지에 보여줄 행의 수
	      int start = (page * pageSize) - pageSize + 1;
	      int end = page * pageSize;
	      int jjimListCount = 0; // 전체 게시글 수
	      int pageBlock = 5; // 표시할 페이지의 수
	      String url = "jjimList.fe";
	      String searchUrl = "";
	      String subUrl= "&M_NICKNAME="+commandMap.get("M_NICKNAME");
	      
	      commandMap.put("START", start);
	      commandMap.put("END", end);

	      List<Map<String, Object>> list = jjimService.getJjimList(commandMap.getMap());

	      if (list.size() > 0) {
	         jjimListCount = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));
	      }

	      // 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할 주소 입력
	      ProductPaging paging = new ProductPaging(jjimListCount, pageBlock, pageSize, page, url, subUrl, searchUrl);

	      mv.addObject("list", list);
	      mv.addObject("paging", paging);
	      return mv;
	   }

	@RequestMapping(value = "/jjimDelete.fe", method = RequestMethod.POST, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> delete(@RequestBody Map<String, Object> map) throws Exception {
		int count = jjimService.deleteJjim(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}

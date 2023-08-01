package com.flee.myPage.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.flee.common.CommandMap;
import com.flee.common.util.FileUpload;
import com.flee.common.util.ProductPaging;
import com.flee.myPage.service.MyInfoService;
import com.flee.review.service.ReviewService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MyProfileController {

	private MyInfoService myInfoService;
	private ReviewService reviewService;

	// 프로필 보이기(상세정보+후기)
	@RequestMapping(value = "/myProfile.fe", method = RequestMethod.GET)
	public ModelAndView main(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("myPage/myProfile");
		
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));
		
		Map<String, Object> map = myInfoService.getMember(commandMap.getMap());

		// 내가 받은 후기 가져오기 Ajax로 구현안하면
		int pageBlock = 5;// 한페이지에 보여줄 행의 수
		commandMap.put("START", (page * pageBlock) - pageBlock + 1);
		commandMap.put("END", page * pageBlock);
		Map<String, Object> review = reviewService.selectReview(commandMap.getMap());

		// 카테고리 가져오기
		Map<String, Object> map2 = myInfoService.getCategory(commandMap.getMap());
		mv.addObject("myInfo", map);
		mv.addObject("myReview", review);
		mv.addObject("myCat", map2);
		return mv;
	}

	// 프로필 수정 폼
	@RequestMapping(value = "/myProfileUpdateForm.fe")
	public ModelAndView myProfileUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("myPage/myProfileUpdateForm");
		Map<String, Object> map = myInfoService.getMember(commandMap.getMap());
		Map<String, Object> map2 = myInfoService.getCategory(commandMap.getMap());

		mv.addObject("myInfo", map);
		mv.addObject("myCat", map2);
		return mv;
	}

	// 프로필 수정
	@RequestMapping(value = "/myProfileUpdate.fe")
	public ModelAndView myProfileUpdate(CommandMap commandMap, MultipartHttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/myPage.fe");

		MultipartFile M_IMAGE_FILE = request.getFile("M_IMAGE");
		String profile = String.valueOf(commandMap.get("M_IMAGE_hidden"));

		long image = System.currentTimeMillis();

		String uploadImageName = "image-" + image + ".jpg";

		// 상품 이미지를 입력할 폴더 설정
		String path = request.getSession().getServletContext().getRealPath("/") + File.separator + "img";
		// 내 프로젝트의
		// 위치/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Flee/
		System.out.println(path);
		if (!M_IMAGE_FILE.isEmpty()) {
			String oldImage = String.valueOf(myInfoService.getMember(commandMap.getMap()).get("M_IMAGE"));
			if (!oldImage.equals("profile")) {
				String delMainPath = path + "/" + oldImage;
				File delMainFile = new File(delMainPath);
				delMainFile.delete();
			}
			FileUpload.fileUpload(M_IMAGE_FILE, path, uploadImageName);
			commandMap.put("M_IMAGE", image);
		} else {
			if (profile != null && profile.equals("profile")) {
				commandMap.put("M_IMAGE", profile);
			}
		}

		myInfoService.updateProfile(commandMap.getMap());
		return mv;
	}
	
	   @RequestMapping(value = "/myProductList.fe")
	   public ModelAndView myProductList(CommandMap commandMap) throws Exception {
	      ModelAndView mv = new ModelAndView("myPage/myProductList");
	      
	      int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
	      int pageSize = 6;// 한 페이지에 보여줄 행의 수
	      int start = (page * pageSize) - pageSize + 1;
	      int end = page * pageSize;
	      int myProductListCount = 0; // 전체 게시글 수
	      int pageBlock = 5; // 표시할 페이지의 수
	      String url = "myProductList.fe";
	      String searchUrl = "";
	      String subUrl = "&M_NICKNAME="+commandMap.get("M_NICKNAME")+"&FILTER=" + commandMap.get("FILTER");;

	      commandMap.put("START", start);
	      commandMap.put("END", end);
	      
	      if (commandMap.get("FILTER") == null) {
	         commandMap.put("FILTER", "P_DATE");
	      }
	      
	      List<Map<String, Object>> list = myInfoService.getMyProductList(commandMap.getMap());
	      if (list.size() > 0) {
	         myProductListCount = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));
	      }
	      // 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
	      // 주소 입력
	      ProductPaging paging = new ProductPaging(myProductListCount, pageBlock, pageSize, page, url, subUrl, searchUrl);

	      mv.addObject("list", list);
	      mv.addObject("paging", paging);
	      return mv;
	   }

}

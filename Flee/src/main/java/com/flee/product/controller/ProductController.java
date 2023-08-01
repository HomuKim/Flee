package com.flee.product.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.flee.common.CommandMap;
import com.flee.common.util.FileUpload;
import com.flee.common.util.ProductPaging;
import com.flee.myPage.service.MyInfoService;
import com.flee.product.service.ProductService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ProductController {

	private ProductService productService;

	// 상품게시판 페이지
	// http://localhost:8000/Flee/productList.fe?P_SELLBUY=0&P_AREA=종로구&P_ITEM=1
	@RequestMapping(value = "/productList.fe")
	public ModelAndView openProductList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("product/productList");

		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 6;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int totalProduct = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String subUrl = "&P_SELLBUY=" + commandMap.get("P_SELLBUY") + "&P_AREA=" + commandMap.get("P_AREA") + "&P_ITEM="
				+ commandMap.get("P_ITEM")+"&FILTER="+commandMap.get("FILTER");// 필터용 url
		String url = "productList.fe";

		String searchUrl = "&type=" + commandMap.get("type") + "&keyword=" + commandMap.get("keyword");

		commandMap.put("START", start);
		commandMap.put("END", end);

		if (commandMap.get("FILTER") == null) {
			commandMap.put("FILTER", "P_DATE");
		}

		List<Map<String, Object>> list = productService.selectProductList(commandMap.getMap());

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

	// 상품 등록폼 페이지
	@RequestMapping(value = "/productWriteForm.fe")
	public ModelAndView openProductWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("product/productWriteForm");

		mv.addObject("P_SELLBUY", commandMap.get("P_SELLBUY"));

		return mv;
	}

	// 상품 등록 완료
	@RequestMapping(value = "/productWrite.fe")
	public ModelAndView writeProduct(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/productList.fe");

		productService.writeProduct(commandMap.getMap(), request);

		mv.addObject("P_SELLBUY", commandMap.get("P_SELLBUY"));
		mv.addObject("P_ITEM", commandMap.get("P_ITEM"));
		mv.addObject("P_AREA", commandMap.get("P_AREA"));

		return mv;
	}

	// 상품 상세 페이지
	@RequestMapping(value = "/productDetail.fe") // http://localhost:8000/Flee/productDetail.fe?P_ID=5
	public ModelAndView openProductDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("product/productDetail");

		Map<String, Object> product = productService.selectProductDetail(commandMap.getMap());
		mv.addObject("proMap", product.get("proMap"));
		mv.addObject("info", product);

		return mv;
	}

	// 상품 수정 페이지
	@RequestMapping(value = "/productUpdateForm.fe") // http://localhost:8000/Flee/productUpdateForm.fe?P_ID=5
	public ModelAndView openProductUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("product/productUpdateForm");

		Map<String, Object> map = productService.selectProductDetail(commandMap.getMap());
		mv.addObject("P_ID", commandMap.get("P_ID"));
		mv.addObject("proMap", map.get("proMap"));
		mv.addObject("list", map.get("iList"));

		return mv;
	}

	// 상품 수정 완료
	@RequestMapping(value = "/productUpdate.fe")
	public ModelAndView updateProduct(CommandMap commandMap, MultipartHttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/productDetail.fe");

		productService.updateProduct(commandMap.getMap(), request);
		productService.selectProductDetail(commandMap.getMap());
		mv.addObject("P_ID", commandMap.get("P_ID"));
		mv.addObject("M_NICKNAME", commandMap.get("M_NICKNAME"));

		return mv;
	}

	// 상품 삭제
	@RequestMapping(value = "/productDelete.fe")
	public ModelAndView deleteProduct(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/productList.fe");

		productService.deleteProduct(commandMap.getMap());
		mv.addObject("P_SELLBUY", commandMap.get("P_SELLBUY"));
		mv.addObject("P_ITEM", commandMap.get("P_ITEM"));
		mv.addObject("P_AREA", commandMap.get("P_AREA"));

		return mv;
	}
}

package com.flee;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flee.common.CommandMap;
import com.flee.product.service.ProductService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MainController {

	private ProductService productService;

	// http://localhost:8000/Flee/main.fe
	@RequestMapping(value = "/main.fe")
	public ModelAndView main(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("main/main");

		commandMap.put("FILTER", "P_COUNT");// 조회수 많은 순
		commandMap.put("START", 1);
		commandMap.put("END", 3);
		String path = request.getSession().getServletContext().getRealPath("/") + File.separator + "img";
		// 내 프로젝트의
		// 위치/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Flee/
		System.out.println(path);

		HttpSession session = request.getSession();

		if (session.getAttribute("EMAIL") == null) {// 로그인 안한경우
			List<Map<String, Object>> list = productService.selectProduct(commandMap.getMap());
			Map<String, Object> map = productService.selectMainAreaProductList(commandMap.getMap());
			mv.addObject("list", map.get("list_area"));
			mv.addObject("cat", list);
			return mv;
		}
		String nickname = (String) session.getAttribute("NICKNAME");
		String email = (String) session.getAttribute("EMAIL");

		if (nickname != null && nickname.length() > 0 && !nickname.equals("")) {// 로그인 한 경우
			if (nickname.equals("ADMIN")) {// 관리자일 경우

			}

			commandMap.put("M_NICKNAME", nickname);
			commandMap.put("EMAIL", email);
			Map<String, Object> map = productService.selectMainAreaProductList(commandMap.getMap());
			List<Map<String, Object>> category = productService.selectMainCategoryProductList(commandMap.getMap());

			mv.addObject("cat", category);
			mv.addObject("list", map.get("list_area"));
			mv.addObject("area", map.get("AREA"));
		}

		return mv;
	}

}

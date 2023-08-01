package com.flee.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flee.common.CommandMap;
import com.flee.member.service.LoginService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class LoginController {

	private LoginService loginService;

	@RequestMapping(value = "/loginForm.fe")
	public String loginForm() throws Exception {
		return "login/loginForm";
	}

	// 로그인 처리
	@RequestMapping(value = "/login.fe", method = RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(true);
		String message = "";
		Map<String, Object> result = loginService.getMember(commandMap.getMap());
		if (result == null) { // 아이디가 있는지 확인
			ModelAndView mav = new ModelAndView("redirect:/loginForm.fe");
			message = "해당 아이디가 존재하지 않습니다.";
			mav.addObject("message",message);
			return mav;

		} else {
			if (result.get("PASSWORD").equals(commandMap.get("PASSWORD"))) { // 비밀번호가 같다면
				if (String.valueOf(result.get("BLOCK")).equals("Y")) {
					ModelAndView mav = new ModelAndView("redirect:/loginForm.fe");
					message = "이용이 정지된 유저입니다.";
					mav.addObject("message", message);
					return mav;
				}		
				ModelAndView mav = new ModelAndView("redirect:/main.fe");
				session.setAttribute("NICKNAME", result.get("M_NICKNAME"));
				session.setAttribute("EMAIL", result.get("EMAIL"));
				return mav;
			} else {// 비밀번호가 일치하지않을 때
				ModelAndView mav = new ModelAndView("redirect:/loginForm.fe");
				message = "비밀번호가 맞지 않습니다.";
				mav.addObject("message",message);
				return mav;
			}
		}
	}

	@RequestMapping(value = "/logout.fe") // 로그아웃
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap)
			throws Exception {
		HttpSession session = request.getSession();
		if (session != null)
			session.invalidate();
		ModelAndView mav = new ModelAndView("redirect:/main.fe");
		
		return mav;
	}

	@RequestMapping(value = "/findEmail.fe") // 이메일 찾기 폼을 보여주는 메소드
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("login/findEmail");
		return mv;
	}

	@RequestMapping(value = "/findEmailResult.fe", method = RequestMethod.POST) // 입력한 정보에 맞춰서 아이디를 찾아주는 거
	public ModelAndView findIdResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("login/findEmail");

		Map<String, Object> member = loginService.findEmail(commandMap.getMap());
		if (member != null) {
			mv.addObject("result", true);
		}else {
			mv.addObject("result", false);
		}
		mv.addObject("e_member", member);
		return mv;
	}
	
	@RequestMapping(value = "/findPwResult.fe", method = RequestMethod.POST) // 입력한 정보에 맞춰서 아이디를 찾아주는 거
	public ModelAndView findPasswordResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("login/findEmail");

		Map<String, Object> member = loginService.findPassword(commandMap.getMap());
		if (member != null) {
			mv.addObject("result", true);
		}else {
			mv.addObject("result", false);
		}
		mv.addObject("p_member", member);
		return mv;
	}
}
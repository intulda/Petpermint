package io.pet.mint.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import io.pet.mint.member.service.MemberService;
import io.pet.mint.member.vo.MemberVO;


@Controller
public class MemberController {

	MemberService memberservice;
	
	@RequestMapping(value="/login.do")
	public String login() {
		return "./login/Login";
	}
	
	@RequestMapping(value="/joinus.do")
	public String joinus() {
		return "./login/Joinus";
	}
	
	//로그인 처리
	@RequestMapping(value="/loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo,HttpSession session) {
		
		boolean result = memberservice.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("login");
		
		if(result) {
			mav.addObject("msg","성공");
		}else {
			mav.addObject("msg","실패");
		}
		
		return mav;
	}
	
	//로그아웃 처리
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		
		memberservice.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		mav.addObject("msg", "logout");
		
		return mav;
	}
		
}



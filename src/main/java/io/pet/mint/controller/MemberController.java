package io.pet.mint.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import io.pet.mint.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import io.pet.mint.member.service.MemberService;
import io.pet.mint.member.vo.MemberVO;


@Controller
public class MemberController {

	@Autowired
	MemberService memberservice;
	
	@RequestMapping(value="/login.do")
	public String login() {
		System.out.println("MemberController login()");
		return "view:login/Login";
	}
	
	@RequestMapping(value="/regi.do", method=RequestMethod.GET)
	public String joinus() {
		return "view:login/Joinus";
	}
	
	
	/*
	 * 
	 * 회원가입시 아이디 중복 확인
	 */
	@ResponseBody
	@RequestMapping(value = "getId.do", method = RequestMethod.POST)
	public String getId(MemberVO vo) {
		System.out.println("MemberController getId()");
		
		int count = memberservice.getId(vo);
		String msg = "";
		if(count > 0) {
			msg = "YES";
		}else {
			msg = "NO";
		}
		return msg;
	}
	
	
	/*
	 * 
	 * 회원가입
	 */
	@RequestMapping(value = "regiAf.do", method=RequestMethod.POST)
	public String regiAf(MemberVO vo) {
		System.out.println("MemberController regiAf " + new Date());
		
		boolean b = memberservice.addmember(vo);
		if(b) {
			System.out.println("회원 가입되었습니다 " + new Date());
			return "view:login/Login";
		}
		System.out.println("가입되지 않았습니다 " + new Date());
		
		return "view:login/Login";
	}
	
	
	
	/*
	 * 
	 * 로그인 이후 처리
	 */
	@RequestMapping(value = "loginAf.do", method=RequestMethod.POST)
	public String loginAf(MemberVO vo, HttpServletRequest req) {
		System.out.println("MemberController loginAf()");
		
		MemberVO login = memberservice.login(vo);
		
		if(login != null && !login.getId().equals("")) {
			// session
			login.setSubNickname(CommonUtil.getSubStr(login.getNickname(), 2));
			req.getSession().setAttribute("login", login);
			req.getSession().setMaxInactiveInterval(60 * 60 * 8);
			System.out.println(login.getId() + "로그인 성공");
			return "redirect:/";
		}
		else {
			System.out.println("로그인 실패");
			return "redirect:/login.do";
		}		
	}
	
	
	/*
	 * 
	 * 로그인 세션 설정
	 */
	@RequestMapping(value = "sessionOut.do", method=RequestMethod.GET)
	public String sessionOut() {
		return "view:login/sessionOut";
	}
	
	@GetMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}



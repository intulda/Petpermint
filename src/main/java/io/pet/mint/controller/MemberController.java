package io.pet.mint.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value="/joinus.do")
	public String joinus() {
		return "view:login/Joinus";
	}
	
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
	
	
	@RequestMapping(value = "joinus.do", method=RequestMethod.POST)
	public String regiAf(MemberVO vo) {
		System.out.println("MemberController joinus " + new Date());
		
		boolean b = memberservice.addmember(vo);
		if(b) {
			System.out.println("회원 가입되었습니다 " + new Date());
			return "view:login/Login";
		} else {
			System.out.println("가입되지 않았습니다 " + new Date());
		}
		
		return "view:login/Joinus";
	}
	
	@RequestMapping(value = "loginAf.do", method=RequestMethod.POST)
	public String loginAf(MemberVO vo, HttpServletRequest req) {
		System.out.println("MemberController loginAf()");
		
		MemberVO login = memberservice.login(vo);
		
		if(login != null && !login.getId().equals("")) {
			// session
			req.getSession().setAttribute("login", login);
			req.getSession().setMaxInactiveInterval(60 * 60 * 8);
			System.out.println(login.getId() + "로그인 성공");
			return "redirect:/";
		}
		else {
			return "redirect:/login.do";
		}		
	}
	
	@RequestMapping(value = "sessionOut.do", method=RequestMethod.GET)
	public String sessionOut() {
		return "view:login/sessionOut";
	}
	
	
	
		
}



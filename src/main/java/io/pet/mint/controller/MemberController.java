package io.pet.mint.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import io.pet.mint.member.dto.MemberDTO;
import io.pet.mint.member.service.MemberService;


@Controller
public class MemberController {

	MemberService memberservice;
	
	@RequestMapping("/Joinus")
    public String memberJoin() {
        return "/login/Joinus";
    }
	
	@RequestMapping("/login")
    public String login() {
        return "/login/Login";
    }

	@RequestMapping(value = "loginAf", method=RequestMethod.POST)
	public String loginAf(MemberDTO dto, HttpServletRequest req) {
		System.out.println("MemberController loginAf()");
		
		MemberDTO login = memberservice.login(dto);
		
		if(login != null && !login.getId().equals("")) {
			// session
			req.getSession().setAttribute("login", login);
			req.getSession().setMaxInactiveInterval(60 * 60 * 8);
			
			return "redirect:/";
		}
		else {
			return "redirect:/login";
		}		
	}
		
}



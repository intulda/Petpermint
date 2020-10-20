package io.pet.mint.member.service;

import javax.servlet.http.HttpSession;

import io.pet.mint.member.vo.MemberVO;

public interface MemberService {

	//로그인 체크
	public boolean loginCheck(MemberVO vo,HttpSession session);
	
	//로그 아웃
	public void logout(HttpSession session);
	
}

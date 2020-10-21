package io.pet.mint.member.service;

import io.pet.mint.member.vo.MemberVO;

public interface MemberService {

	//List<MemberDto> allMember();
	
	int getId(MemberVO vo);
	boolean addmember(MemberVO vo);
	
	MemberVO login(MemberVO vo);
	
}

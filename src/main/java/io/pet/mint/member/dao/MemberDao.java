package io.pet.mint.member.dao;

import io.pet.mint.member.vo.MemberVO;

public interface MemberDao {
	
	//List<MemberDto> allMember();
	
	int getId(MemberVO vo);
	boolean addmember(MemberVO vo);
	MemberVO login(MemberVO vo);
	
}

package io.pet.mint.member.service;

import io.pet.mint.member.dto.MemberDTO;

public interface MemberService {

	int getId(MemberDTO mem);
	boolean addmember(MemberDTO mem);
	MemberDTO login(MemberDTO dto);
}

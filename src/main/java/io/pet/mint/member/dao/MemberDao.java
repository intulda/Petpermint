package io.pet.mint.member.dao;

import io.pet.mint.member.dto.MemberDTO;

public interface MemberDao {

	int getId(MemberDTO mem);
	boolean addmember(MemberDTO mem);
	MemberDTO login(MemberDTO dto);
	
}

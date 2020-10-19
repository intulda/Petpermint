package io.pet.mint.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import io.pet.mint.member.dao.MemberDao;
import io.pet.mint.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	/*
	@Override
	public List<MemberDto> allMember() {		
		return memberDao.allMember();
	}
	*/

	@Override
	public int getId(MemberDTO mem) {		
		return memberDao.getId(mem);		
	}
	
	@Override
	public boolean addmember(MemberDTO mem) {		
		return memberDao.addmember(mem);		
	}

	@Override
	public MemberDTO login(MemberDTO dto) {		
		return memberDao.login(dto);		
	}
	
	
}






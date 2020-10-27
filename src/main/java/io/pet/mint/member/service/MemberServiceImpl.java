package io.pet.mint.member.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.pet.mint.member.dao.MemberDao;
import io.pet.mint.member.vo.MemberVO;

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
	public int getId(MemberVO vo) {		
		return memberDao.getId(vo);		
	}
	
	@Override
	public boolean addmember(MemberVO vo) {		
		return memberDao.addmember(vo);		
	}

	@Override
	public MemberVO login(MemberVO vo) {
		return memberDao.login(vo);
	}
	
	
	
	
}






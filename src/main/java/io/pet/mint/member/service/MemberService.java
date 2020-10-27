package io.pet.mint.member.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.pet.mint.member.dao.MemberDao;
import io.pet.mint.member.vo.MemberVO;

@Service
@Transactional
public class MemberService{

	@Autowired	
	MemberDao memberDao;
	
	/*
	public List<MemberDto> allMember() {		
		return memberDao.allMember();
	}
	*/

	public int getId(MemberVO vo) {		
		return memberDao.getId(vo);		
	}
	
	public boolean addmember(MemberVO vo) {		
		return memberDao.addmember(vo);
	}
	
	public MemberVO login(MemberVO vo) {
		return memberDao.login(vo);
	}
	
	public void memberUpdate(MemberVO vo) {
		memberDao.memberUpdate(vo);
	}
	
	
	
	
}






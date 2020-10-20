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

	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		
		boolean result = memberDao.loginCheck(vo);
		if (result == true) {	//true 일경우 세션 등록
			//세션 변수 등록
			session.setAttribute("userId",vo.getId());
		}
		
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		memberDao.logout(session);
	}
	
	
}






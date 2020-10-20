package io.pet.mint.member.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import io.pet.mint.member.vo.MemberVO;

@Mapper
@Repository
public interface MemberDao {
	
	//로그인 체크
	public boolean loginCheck(MemberVO vo);
	
	//로그 아웃
	public void logout(HttpSession session);
	
}

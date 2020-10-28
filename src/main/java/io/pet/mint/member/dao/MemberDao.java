package io.pet.mint.member.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import io.pet.mint.member.vo.MemberVO;

@Mapper
@Repository
public interface MemberDao {
	
	//List<MemberDto> allMember();
	
	public int getId(MemberVO vo);
	public boolean addmember(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public void memberUpdate(MemberVO vo);
	
}

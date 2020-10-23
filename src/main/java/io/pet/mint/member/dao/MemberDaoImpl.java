package io.pet.mint.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.pet.mint.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Member.";
	/*
	@Override
	public List<MemberDto> allMember() {
		List<MemberDto> list = sqlSession.selectList(namespace + "allMember");
		return list;
	}
	*/
	
	@Override
	public int getId(MemberVO vo) {		
		return sqlSession.selectOne(namespace + "getId", vo);
	}
	
	@Override
	public boolean addmember(MemberVO vo) {		
		int n = sqlSession.insert(namespace + "addmember", vo);		
		return n>0?true:false;
	}

	@Override
	public MemberVO login(MemberVO vo) {
		MemberVO mem = sqlSession.selectOne(namespace + "login", vo);
		return mem;
	}
	

	
}










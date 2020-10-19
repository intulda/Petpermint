package io.pet.mint.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import io.pet.mint.member.dto.MemberDTO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired	
	SqlSession sqlSession;	
	
	String namespace = "Member.";
	
	@Override
	public int getId(MemberDTO mem) {		
		return sqlSession.selectOne(namespace + "getId", mem);
	}
	
	@Override
	public boolean addmember(MemberDTO mem) {		
		int n = sqlSession.insert(namespace + "addmember", mem);		
		return n>0?true:false;
	}

	@Override
	public MemberDTO login(MemberDTO dto) {
		MemberDTO mem = sqlSession.selectOne(namespace + "login", dto);
		return mem;
	}
	
	
}










package io.pet.mint.member.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.pet.mint.member.vo.MemberVO;

@Mapper
@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired	
	SqlSessionTemplate sqlSession;	
	
	// String namespace = "Member.";
	
	//로그인 체크
	public boolean loginCheck(MemberVO vo) {
		System.out.println("===> Mybatis로 loginCheck() 기능 처리");
		String name = sqlSession.selectOne("memberMapper.loginCheck",vo);
		
		// 검색이 안되면 0을 반환해주기 때문에 0과 비교해서 참이면 false, 틀리면 true를 반환
		return (Integer.parseInt(name)==0)?false:true;
	}
	
	//로그 아웃
	@Override
	public void logout(HttpSession session) {
		System.out.println("===> 로그아웃 기능 처리");
		session.invalidate();
	}


	
}










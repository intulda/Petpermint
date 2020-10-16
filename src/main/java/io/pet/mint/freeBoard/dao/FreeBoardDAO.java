package io.pet.mint.freeBoard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import io.pet.mint.freeBoard.dto.FreeBoardDTO;
import io.pet.mint.freeBoard.dto.FreeBoardParam;

@Mapper
@Repository
public interface FreeBoardDAO {
	
	//게시글 작성
	public int addFreeBoardPage(FreeBoardDTO dto);
	
	//게시글 목록
	public List<FreeBoardDTO> getFreeBoardList();
	
	//검색, 페이징
	public List<FreeBoardDTO> freeBoardSearch(FreeBoardParam par);
	
	//검색 후 카운트
	public int freeBoardPaging(FreeBoardParam par);
	
}

package io.pet.mint.freeBoard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import io.pet.mint.freeBoard.dto.FreeCommDTO;
import io.pet.mint.freeBoard.dto.FreeCommParam;

@Mapper
@Repository
public interface FreeCommDAO {
	
	//댓글 작성
	public int addFreeComm(FreeCommDTO comm);
	
	//댓글 목록
	public List<FreeCommDTO> getFreeCommList(FreeCommParam param);
	
	//댓글 카운트
	public int getCommCount(int commRef);
	
	//댓글 삭제
	public int freeCommDelete(int commSeq);
	
	//댓글 수정
	public int freeCommUpdate(FreeCommDTO dto);
}

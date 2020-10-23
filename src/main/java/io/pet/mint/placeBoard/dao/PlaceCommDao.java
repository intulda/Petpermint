package io.pet.mint.placeBoard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import io.pet.mint.placeBoard.dto.PlaceCommDto;
import io.pet.mint.placeBoard.dto.PlaceCommParam;

@Mapper
@Repository
public interface PlaceCommDao {
	
	// 댓글 등록
	public int placeCommWrite(PlaceCommDto commDto);
	// 댓글리스트 출력
	public List<PlaceCommDto> getCommList(PlaceCommParam param);
	// 댓글갯수 카운팅
	public int getCommCount(int commRef);
	// 댓글 수정
	public int placeCommUpdate(PlaceCommDto commDto);
	// 댓글 삭제
	public int placeCommDelete(int commSeq);
	
}

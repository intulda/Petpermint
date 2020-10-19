package io.pet.mint.placeBoard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import io.pet.mint.placeBoard.dto.PlaceBoardDto;
import io.pet.mint.placeBoard.dto.PlaceBoardParam;

@Mapper
@Repository
public interface PlaceBoardDao {
	
	// 게시물 등록
	public int placeBoardWrite(PlaceBoardDto placeDto);
	// 게시물상세페이지 출력
	public PlaceBoardDto getPlaceBoardContent(int boardSeq);
	// 게시물리스트 출력
	public List<PlaceBoardDto> getPlaceBoardList(PlaceBoardParam param);
	// 게시물 갯수 카운팅
	public int getCount(PlaceBoardParam param);
	// 게시물 수정
	public int placeBoardUpdate(PlaceBoardDto placeDto);
	// 게시물 삭제
	public int placeBoardDelete(int boardSeq);
}

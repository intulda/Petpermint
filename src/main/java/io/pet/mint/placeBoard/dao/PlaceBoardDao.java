package io.pet.mint.placeBoard.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import io.pet.mint.placeBoard.dto.PlaceBoardDto;

@Mapper
@Repository
public interface PlaceBoardDao {
	
	
	public int placeBoardWrite(PlaceBoardDto placeDto);
	public PlaceBoardDto getPlaceBoardContent(int boardSeq);	// seq번호 매개변수로 수정해야함
	
}

package io.pet.mint.placeBoard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import io.pet.mint.placeBoard.dto.PlaceBoardDto;
import io.pet.mint.placeBoard.dto.PlaceBoardParam;

@Mapper
@Repository
public interface PlaceBoardDao {
	
	
	public int placeBoardWrite(PlaceBoardDto placeDto);
	public PlaceBoardDto getPlaceBoardContent(int boardSeq);	// seq번호 매개변수로 수정해야함
	public List<PlaceBoardDto> getPlaceBoardList(PlaceBoardParam param);
	public int getCount(PlaceBoardParam param);
	public int placeBoardUpdate(PlaceBoardDto placeDto);
	public int placeBoardDelete(int boardSeq);
}

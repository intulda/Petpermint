package io.pet.mint.placeBoard.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import io.pet.mint.placeBoard.dto.ImagesDto;

@Mapper
@Repository
public interface ImagesDao {

	public int saveImages(ImagesDto imageDto);
	public ImagesDto getImages(int boardSeq);
	 
}

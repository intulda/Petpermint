package io.pet.mint.placeBoard.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import io.pet.mint.placeBoard.dto.ImagesDto;

@Mapper
@Repository
public interface ImagesDao {
	
	// 이미지 저장
	public int saveImages(ImagesDto imageDto);
	// 이미지 출력
	public ImagesDto getImages(int boardSeq);
	// 이미지 수정
	public int updateImages(ImagesDto imageDto); 
}

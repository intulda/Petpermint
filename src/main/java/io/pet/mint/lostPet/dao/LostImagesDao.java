package io.pet.mint.lostPet.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import io.pet.mint.lostPet.dto.LostImagesDto;

@Mapper
@Repository
public interface LostImagesDao {
	
	public int saveImages(LostImagesDto imageDto);
	public LostImagesDto getImages(int lostpetSeq);
	public int updateImages(LostImagesDto imageDto); 

}

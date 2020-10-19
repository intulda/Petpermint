package io.pet.mint.lostPet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.pet.mint.lostPet.dao.LostImagesDao;
import io.pet.mint.lostPet.dto.LostImagesDto;



@Service
@Transactional
public class LostImagesService {
	
	
	@Autowired
	LostImagesDao imageDao;
	
	
	public  int saveImages(LostImagesDto imageDto) {
		
		return imageDao.saveImages(imageDto);
		
	}
	
	public LostImagesDto getImages(int lostpetSeq) {
		
		return imageDao.getImages(lostpetSeq);
	}
	
	public int updateImages(LostImagesDto imageDto) {
		
		return imageDao.updateImages(imageDto);
	}
	
}
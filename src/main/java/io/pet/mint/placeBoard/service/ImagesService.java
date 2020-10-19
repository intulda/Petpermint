package io.pet.mint.placeBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.pet.mint.placeBoard.dao.ImagesDao;
import io.pet.mint.placeBoard.dto.ImagesDto;

@Service
@Transactional
public class ImagesService {
	
	@Autowired
	ImagesDao imageDao;
	
	
	// 이미지 저장
	public  int saveImages(ImagesDto imageDto) {
		
		return imageDao.saveImages(imageDto);	
	}
	// 이미지 출력
	public ImagesDto getImages(int boardSeq) {
		
		return imageDao.getImages(boardSeq);
	}
	// 이미지 수정
	public int updateImages(ImagesDto imageDto) {
		
		return imageDao.updateImages(imageDto);
	}
	
}

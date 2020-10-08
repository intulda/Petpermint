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
	ImagesDao dao;
	
	
	public  int saveImages(ImagesDto imageDto) {
		
		return dao.saveImages(imageDto);
		
	}
	
	public ImagesDto getImages(int boardSeq) {
		
		return dao.getImages(boardSeq);
	}
	
}

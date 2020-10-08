package io.pet.mint.placeBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.pet.mint.placeBoard.dao.PlaceBoardDao;
import io.pet.mint.placeBoard.dto.PlaceBoardDto;

@Service
@Transactional
public class PlaceBoardService {
	
	@Autowired
	PlaceBoardDao placeBoardDao;
	
	public int placeBoardWrite(PlaceBoardDto placeDto) {
		
		return placeBoardDao.placeBoardWrite(placeDto);
		
	}
	
	
	public PlaceBoardDto getPlaceBoardContent(int boardSeq) {
		
		return placeBoardDao.getPlaceBoardContent(boardSeq);
	}
	
}

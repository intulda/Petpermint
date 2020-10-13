package io.pet.mint.placeBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.pet.mint.placeBoard.dao.PlaceBoardDao;
import io.pet.mint.placeBoard.dto.PlaceBoardDto;
import io.pet.mint.placeBoard.dto.PlaceBoardParam;

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
	
	public List<PlaceBoardDto> getPlaceBoardList(PlaceBoardParam param){
		
		return placeBoardDao.getPlaceBoardList(param);
	}
	
	public int getCount(PlaceBoardParam param) {
		
		return placeBoardDao.getCount(param);
	}
	
}

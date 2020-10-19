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
	
	
	// 게시물 등록
	public int placeBoardWrite(PlaceBoardDto placeDto) {
		
		return placeBoardDao.placeBoardWrite(placeDto);	
	}	
	// 게시물상세페이지 출력
	public PlaceBoardDto getPlaceBoardContent(int boardSeq) {
		
		return placeBoardDao.getPlaceBoardContent(boardSeq);
	}	
	// 게시물리스트 출력
	public List<PlaceBoardDto> getPlaceBoardList(PlaceBoardParam param){
		
		return placeBoardDao.getPlaceBoardList(param);
	}	
	// 게시물갯수 카운팅
	public int getCount(PlaceBoardParam param) {
		
		return placeBoardDao.getCount(param);
	}	
	// 게시물 수정
	public int placeBoardUpdate(PlaceBoardDto placeDto) {
		
		return placeBoardDao.placeBoardUpdate(placeDto);
	}	
	// 게시물 삭제
	public int placeBoardDelete(int boardSeq) {
		
		return placeBoardDao.placeBoardDelete(boardSeq);
	}
	
}

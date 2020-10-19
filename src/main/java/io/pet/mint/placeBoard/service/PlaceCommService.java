package io.pet.mint.placeBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.pet.mint.placeBoard.dao.PlaceCommDao;
import io.pet.mint.placeBoard.dto.PlaceCommDto;
import io.pet.mint.placeBoard.dto.PlaceCommParam;

@Transactional
@Service
public class PlaceCommService {
	
	@Autowired
	PlaceCommDao commDao;
	
	
	// 댓글 등록
	public int placeCommWrite(PlaceCommDto commDto) {
		
		return commDao.placeCommWrite(commDto);
	};
	// 댓글리스트 출력
	public List<PlaceCommDto> getCommList(PlaceCommParam param){
		
		return commDao.getCommList(param);
	}
	// 댓글갯수 카운팅
	public int getCommCount(int commRef) {
		
		return commDao.getCommCount(commRef);
	}
	// 댓글 수정
	public int placeCommUpdate(PlaceCommDto commDto) {
		
		return commDao.placeCommUpdate(commDto);
	}
	// 댓글 삭제
	public int placeCommDelete(int commSeq) {
		
		return commDao.placeCommDelete(commSeq);
	}
}

package io.pet.mint.freeBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.pet.mint.freeBoard.dao.FreeLikeDAO;
import io.pet.mint.freeBoard.dto.FreeLikeDTO;

@Service
@Transactional
public class FreeLikeService {

	@Autowired
	FreeLikeDAO dao;
	
	public int freeLikeButton(FreeLikeDTO dto) {
		return dao.freeLikeButton(dto);
	}
	
	public int getLikeCount(int boardSeq) {
		return dao.getLikeCount(boardSeq);
	}
	
	public int likeDelete(int boardSeq) {
		return dao.likeDelete(boardSeq);
	}
}

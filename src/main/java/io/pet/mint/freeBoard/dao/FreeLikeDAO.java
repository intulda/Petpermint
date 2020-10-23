package io.pet.mint.freeBoard.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import io.pet.mint.freeBoard.dto.FreeLikeDTO;


@Mapper
@Repository
public interface FreeLikeDAO {
	
	//좋아요
	public int freeLikeButton(FreeLikeDTO dto);
	
	//좋아요 카운트
	public int getLikeCount(int boardSeq);
	
	//좋아요 뷰카운트
	public int likeDelete(int boardSeq);
	
}

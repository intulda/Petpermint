package io.pet.mint.info.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import io.pet.mint.info.dto.InfoDto;
import io.pet.mint.info.dto.InfoImagesDto;
import io.pet.mint.info.dto.InfoParam;


@Mapper
@Repository
public interface InfoDao {
	
	public List<InfoDto> dogListPage(InfoParam par);

	public List<InfoDto> catListPage(InfoParam par);
	
	int infoWrite(InfoDto dto); //글 쓰기
	
	InfoDto infoDetail(int seq); //디테일 글
	
	InfoDto infoUpDate(int seq); //바꾸가싫어서 만들음
	
	InfoImagesDto imgDetail(int seq); //디테일 이미지
	
	int imgSave(InfoImagesDto dto);//저장..
	
	void infoUpDateAf(InfoDto dto); //업데이트
	
	void imgUpDate(InfoImagesDto filePath); //업데이트 이미지
	
	void infoDelete(int seq); //삭제
	
	public int getParamCount(InfoParam par);
	
	public int viewCounting(int seq);


}

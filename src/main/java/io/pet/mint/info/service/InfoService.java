package io.pet.mint.info.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import io.pet.mint.info.dao.InfoDao;
import io.pet.mint.info.dto.InfoDto;
import io.pet.mint.info.dto.InfoImagesDto;
import io.pet.mint.info.dto.InfoParam;

@Service
@Transactional
public class InfoService {
	
	@Autowired
	InfoDao dao;
	
	public List<InfoDto> dogListPage(InfoParam par){
		List<InfoDto> list = dao.dogListPage(par);
		System.out.println("getinfolist = "+list.size() + ", PARAM = "+ par.toString());
		return list;
	}
	
	public int getInfoListCount(InfoParam param) {
		return dao.getInfoListCount(param);
	}
	
	public int getParamCount(InfoParam par) {
		return dao.getParamCount(par);
	}
	
	public int infoWrite(InfoDto dto) {
		return dao.infoWrite(dto);
	}
	
	public InfoDto infoDetail(int seq) {
		return dao.infoDetail(seq);
	}
	
	public InfoDto infoUpDate(int seq) {
		return dao.infoUpDate(seq);
	}
	
	public int imgSave(InfoImagesDto dto) {
		return dao.imgSave(dto);
	}
	
	public InfoImagesDto imgDetail(int seq) {
		return dao.imgDetail(seq);
	}
	
	public void infoUpDateAf(InfoDto dto) {
		dao.infoUpDateAf(dto);
	}
	
	public void imgUpDate(InfoImagesDto filePath) {
		dao.imgUpDate(filePath);
	}
	
	public void infoDelete(int seq) {
		 dao.infoDelete(seq);
	}
	
}

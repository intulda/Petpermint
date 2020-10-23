package io.pet.mint.freeBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.pet.mint.freeBoard.dao.FreeBoardDAO;
import io.pet.mint.freeBoard.dto.FreeBoardDTO;
import io.pet.mint.freeBoard.dto.FreeBoardParam;

@Service
@Transactional
public class FreeBoardService {
	
	@Autowired
	FreeBoardDAO dao;
	
	public int addFreeBoardPage (FreeBoardDTO dto){
		return dao.addFreeBoardPage(dto);
	}
	
	public List<FreeBoardDTO> getFreeBoardList (){
		return dao.getFreeBoardList();
	}
	
	public List<FreeBoardDTO> freeBoardSearch(FreeBoardParam par){
		return dao.freeBoardSearch(par);
	}
	
	public int freeBoardPaging(FreeBoardParam par) {
		return dao.freeBoardPaging(par);
	}
	
	public FreeBoardDTO freeDetail(int boardSeq) {
		return dao.freeDetail(boardSeq);
	}
	
	public int freeBoardDelete(int boardSeq) {
		return dao.freeBoardDelete(boardSeq);
	}
	
	public int freeBoardUpdate(FreeBoardDTO dto) {
		return dao.freeBoardUpdate(dto);
	}
	
}

package io.pet.mint.freeBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.pet.mint.freeBoard.dao.FreeCommDAO;
import io.pet.mint.freeBoard.dto.FreeCommDTO;
import io.pet.mint.freeBoard.dto.FreeCommParam;

@Service
@Transactional
public class FreeCommService {
	
	@Autowired
	FreeCommDAO dao;

	public int addFreeComm(FreeCommDTO comm) {
		return dao.addFreeComm(comm);
	}
	
	public List<FreeCommDTO> getFreeCommList(FreeCommParam param){
		return dao.getFreeCommList(param);
	}
	
	public int getCommCount(int commRef) {
		return dao.getCommCount(commRef);
	}
	
	public int freeCommDelete(int commSeq) {
		return dao.freeCommDelete(commSeq);
	}
	
	public int freeCommUpdate(FreeCommDTO dto) {
		return dao.freeCommUpdate(dto);
	}
}

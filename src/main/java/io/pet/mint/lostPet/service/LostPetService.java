package io.pet.mint.lostPet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.pet.mint.lostPet.dao.LostPetDao;
import io.pet.mint.lostPet.dto.LCommDto;
import io.pet.mint.lostPet.dto.LostPetDto;
import io.pet.mint.lostPet.dto.LostPetParamPage;

@Service
@Transactional
public class LostPetService {
	
	@Autowired
	LostPetDao dao;
	
	public List<LostPetDto> getLostPetList() {
		return dao.getLostPetList();
	}
	
	public LostPetDto getLostPetDetail(int seq) {
		return dao.getLostPetDetail(seq);
	}
	
	public int getLostViewcount(int seq) {
		return dao.getLostViewcount(seq);		
	}

	public int getLostPetWrite(LostPetDto dto) {
		return dao.getLostPetWrite(dto);
	}
	
	public int getLostPetUpdate(LostPetDto dto) {
		return dao.getLostPetUpdate(dto);
	}
	
	public int getLostPetDelete(int seq) {
		return dao.getLostPetDelete(seq);
	}
	
	public List<LCommDto> getLCommList(int seq) {
		return dao.getLCommList(seq);
	}
	
	public int getLostPetLCommWrite(LCommDto dto) {
		return dao.getLostPetLCommWrite(dto);
	}
	
	public int getLCommUpdate(LCommDto dto) {
		return dao.getLCommUpdate(dto);
	}
	
	public int getLCommDel(int lcommSeq) {
		return dao.getLCommDel(lcommSeq);
	}
	
	
	public LCommDto getLCommDto(int seq) {
		return dao.getLCommDto(seq);
	}
	
	
	
}

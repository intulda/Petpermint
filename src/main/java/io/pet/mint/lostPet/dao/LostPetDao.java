package io.pet.mint.lostPet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.pet.mint.lostPet.dto.LCommDto;
import io.pet.mint.lostPet.dto.LostPetDto;
import io.pet.mint.lostPet.dto.LostPetParamPage;

@Mapper
@Repository
public interface LostPetDao {

	public List<LostPetDto> getLostPetList();
	
	LostPetDto getLostPetDetail(int seq);
	public int getLostViewcount(int seq);
	public List<LCommDto> getLCommList(int seq);

	int getLostPetWrite(LostPetDto dto);	
	int getLostPetUpdate(LostPetDto dto);
	int getLostPetDelete(int seq);
	
	int getLostPetLCommWrite(LCommDto dto);
	int getLCommUpdate(LCommDto lcommDto);
	int getLCommDel(int lcommSeq);
	LCommDto getLCommDto(int seq);
	
}

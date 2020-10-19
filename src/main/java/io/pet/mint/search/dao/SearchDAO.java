package io.pet.mint.search.dao;

import io.pet.mint.lostPet.dto.LostPetDto;
import io.pet.mint.search.dto.SearchDTO;
import io.pet.mint.search.dto.SearchParamDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SearchDAO {
    /**
     * 보드 리스트
     * @param searchParamDTO
     * @return
     */
    List<SearchDTO> getBoardList(SearchParamDTO searchParamDTO);

    /**
     * 유기동물 리스트
     * @param searchParamDTO
     * @return
     */
    List<LostPetDto> getLostPetList(SearchParamDTO searchParamDTO);
}

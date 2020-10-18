package io.pet.mint.search.service;

import io.pet.mint.lostPet.dto.LostPetDto;
import io.pet.mint.search.dto.SearchDTO;
import io.pet.mint.search.dto.SearchLostPetDTO;
import io.pet.mint.search.dto.SearchParamDTO;
import io.pet.mint.search.dao.SearchDAO;
import io.pet.mint.util.CommonUtil;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class SearchService {

    private final int MAX_COUNT = 8;
    private SearchDAO searchDAO;

    public SearchService(SearchDAO searchDAO) {
        this.searchDAO = searchDAO;
    }

    public List<SearchDTO> getBoardList(SearchParamDTO searchParamDTO) {
        searchDAO.getBoardList(searchParamDTO);
        return searchParamDTO.getBoardResult().size() > 0 ? searchParamDTO.getBoardResult() : new ArrayList<>();
    }

    public List<SearchLostPetDTO> getLostPetList(SearchParamDTO searchParamDTO) {
        searchDAO.getLostPetList(searchParamDTO);
        return searchParamDTO.getLostPetResult().size() > 0 ? searchParamDTO.getLostPetResult() : new ArrayList<>();
    }

    public List<?> getBoardTypeFilter(String type, List<?> selectList) {
        if("LOST_PET".equals(type)) {
            int count = selectList.size();
            return ((List<SearchLostPetDTO>)selectList).stream()
                    .map(e -> {
                        if(e.getImagesPath() != null) {
                            e.setThumbnail(CommonUtil.imageToBase64(e.getImagesPath()));
                        }
                        e.setCount(count);
                        return e;
                    })
                    .limit(MAX_COUNT)
                    .collect(Collectors.toList());
        } else {
            int count = getCount(type, (List<SearchDTO>)selectList);
            return ((List<SearchDTO>)selectList).stream()
                    .filter(e -> e.getBoardType().contains(type))
                    .map(e -> {
                        if(e.getImagesPath() != null) {
                            e.setThumbnail(CommonUtil.imageToBase64(e.getImagesPath()));
                        }
                        e.setCount(count);
                        return e;
                    })
                    .limit(MAX_COUNT)
                    .collect(Collectors.toList());
        }
    }

    public int getCount(String type, List<SearchDTO> selectList) {
        return (int)selectList.stream().filter(e -> e.getBoardType().contains(type)).count();
    }
}

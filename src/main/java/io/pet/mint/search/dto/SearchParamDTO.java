package io.pet.mint.search.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@Setter
@Getter
public class SearchParamDTO {

    private String boardType;
    private String keyword;
    private List<SearchDTO> boardResult;
    private List<SearchLostPetDTO> lostPetResult;

    public SearchParamDTO() {
        this.keyword = "";
        this.boardResult = new ArrayList<>();
        this.lostPetResult = new ArrayList<>();
    }
}

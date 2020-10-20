package io.pet.mint.search.dto;

import io.pet.mint.lostPet.dto.LostPetDto;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class SearchLostPetDTO extends LostPetDto {

    private byte[] imagesPath;
    private String lostKind;
    private String thumbnail;
    private String lostTypeName;
    private String lostGenderName;
    private String lostStatusName;
    private int count;

}

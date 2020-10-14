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

    private byte[] imagePath;
    private String thumbnail;
}

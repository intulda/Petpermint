package io.pet.mint.search.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
public class SearchDTO {

    private int boardSeq;
    private String boardType;
    private String boardCategory;
    private String boardTitle;
    private String id;
    private String boardLocation;
    private String boardContents;
    private byte[] imagePath;
    private String thumbnail;

}

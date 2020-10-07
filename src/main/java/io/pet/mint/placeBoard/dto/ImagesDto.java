package io.pet.mint.placeBoard.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@AllArgsConstructor
@ToString
public class ImagesDto implements Serializable {
/*	
DROP TABLE BOARD_IMAGES
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_IMAGES

CREATE TABLE BOARD_IMAGES(
       
    IMAGES_SEQ NUMBER NOT NULL,
    BOARD_SEQ NUMBER NOT NULL,
    IMAGES_PATH VARCHAR2(500),
    REG_ID VARCHAR2(100) NOT NULL,
    REG_DATE DATE NOT NULL
)
CREATE SEQUENCE SEQ_IMAGES
START WITH 1
INCREMENT BY 1	
*/
	private int imagesSeq;
	private int BoardSeq;
	private String imagesPath;
	private String regId;
	private String regDate;
}

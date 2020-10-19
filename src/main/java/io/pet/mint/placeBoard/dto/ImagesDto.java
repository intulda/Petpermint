package io.pet.mint.placeBoard.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
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
	private int imagesSeq;			// 이미지 시퀀스 번호
	private int BoardSeq;			// 게시물 시퀀스 번호
	private byte[] imagesPath;		// 저장된 이미지 파일
	private String regId;			// 이미지 등록한 사람
	private String regDate;			// 이미지 등록일
	
	public ImagesDto() {}


	public ImagesDto(int imagesSeq, int boardSeq, byte[] imagesPath, String contents, String regId, String regDate,
			String imageName) {
		super();
		this.imagesSeq = imagesSeq;
		BoardSeq = boardSeq;
		this.imagesPath = imagesPath;
		this.regId = regId;
		this.regDate = regDate;
	}
	
}

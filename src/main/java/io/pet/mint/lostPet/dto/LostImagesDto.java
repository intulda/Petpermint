package io.pet.mint.lostPet.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LostImagesDto {
	
	private int lostpetSeq;
	private int imagesSeq;
	private byte[] imagesPath;
	private String regId;
	private String regDate;
	
	public LostImagesDto() {
	
	}

	public LostImagesDto(int lostpetSeq, int imagesSeq, byte[] imagesPath, String regId, String regDate) {
		super();
		this.lostpetSeq = lostpetSeq;
		this.imagesSeq = imagesSeq;
		this.imagesPath = imagesPath;
		this.regId = regId;
		this.regDate = regDate;
	}
	
	
	
	
	



}

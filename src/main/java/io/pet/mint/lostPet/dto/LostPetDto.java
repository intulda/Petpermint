package io.pet.mint.lostPet.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class LostPetDto {

	private int lostSeq;
	private String lostId;
	private String lostKind;
	private int lostViewcount;
	private int lostStatus;
	private String lostLocation;
	private String lostPhone;
	private int lostType;
	private int lostGender;
	private String lostDetail;
	private int lostDel;
	private String lostWdate;
	
	private String imagePath;		// 썸네일 이미지 경로명, db저장 x
	
	public LostPetDto() {
		// TODO Auto-generated constructor stub
	}

	public LostPetDto(int lostSeq, String lostId, String lostKind, int lostViewcount, int lostStatus,
			String lostLocation, String lostPhone, int lostType, int lostGender, String lostDetail, int lostDel,
			String lostWdate, String imagePath) {
		super();
		this.lostSeq = lostSeq;
		this.lostId = lostId;
		this.lostKind = lostKind;
		this.lostViewcount = lostViewcount;
		this.lostStatus = lostStatus;
		this.lostLocation = lostLocation;
		this.lostPhone = lostPhone;
		this.lostType = lostType;
		this.lostGender = lostGender;
		this.lostDetail = lostDetail;
		this.lostDel = lostDel;
		this.lostWdate = lostWdate;
		this.imagePath = imagePath;
	}
	
	

}
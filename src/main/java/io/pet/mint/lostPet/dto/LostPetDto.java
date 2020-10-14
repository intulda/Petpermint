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
	private String lostDate;
	private String lostWdate;
	private String lostKind;
	private int lostViewcount;
	private int lostStatus;
	private String lostLocation;
	private String lostPhone;
	private int lostType;
	private int lostGender;
	private String lostDetail;
	private int lostDel;
	
	private String imagePath;		// 썸네일 이미지 경로명, db저장 x
	
	public LostPetDto() {
		// TODO Auto-generated constructor stub
	}

	public LostPetDto(int lostSeq, String lostId, String lostKind, int lostViewcount, int lostStatus,
			String lostLocation, String lostPhone, int lostType, int lostGender, String lostDetail, int lostDel,
			String imagePath) {
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
		this.imagePath = imagePath;
	}

	public String getLostLocation() {
		return lostLocation;
	}

	public void setLostLocation(String lostLocation) {
		this.lostLocation = lostLocation;
	}

	public String getLostPhone() {
		return lostPhone;
	}

	public void setLostPhone(String lostPhone) {
		this.lostPhone = lostPhone;
	}

	public int getLostType() {
		return lostType;
	}

	public void setLostType(int lostType) {
		this.lostType = lostType;
	}

	public int getLostGender() {
		return lostGender;
	}

	public void setLostGender(int lostGender) {
		this.lostGender = lostGender;
	}

	public String getLostDetail() {
		return lostDetail;
	}

	public void setLostDetail(String lostDetail) {
		this.lostDetail = lostDetail;
	}

	public int getLostDel() {
		return lostDel;
	}

	public void setLostDel(int lostDel) {
		this.lostDel = lostDel;
	}

	public String getLostWdate() {
		return lostWdate;
	}

	public void setLostWdate(String lostWdate) {
		this.lostWdate = lostWdate;
	}

	@Override
	public String toString() {
		return "LostPetDto [lostSeq=" + lostSeq + ", lostId=" + lostId + ", lostDate=" + lostDate + ", lostViewcount="
				+ lostViewcount + ", lostStatus=" + lostStatus + ", lostLocation=" + lostLocation + ", lostPhone="
				+ lostPhone + ", lostType=" + lostType + ", lostGender=" + lostGender + ", lostDetail=" + lostDetail
				+ ", lostDel=" + lostDel + "]";
	}
}
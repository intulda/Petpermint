package io.pet.mint.lostPet.dto;

public class LostPetDto {

	private int lostSeq;
	private String lostId;
	private String lostDate;
	private String lostWdate;
	private int lostViewcount;
	private int lostStatus;
	private String lostLocation;
	private String lostPhone;
	private int lostType;
	private int lostGender;
	private String lostDetail;
	private int lostDel;
	
	public LostPetDto() {
		// TODO Auto-generated constructor stub
	}

	public LostPetDto(int lostSeq, String lostId, String lostDate, int lostViewcount, int lostStatus,
			String lostLocation, String lostPhone, int lostType, int lostGender, String lostDetail, int lostDel) {
		super();
		this.lostSeq = lostSeq;
		this.lostId = lostId;
		this.lostDate = lostDate;
		this.lostViewcount = lostViewcount;
		this.lostStatus = lostStatus;
		this.lostLocation = lostLocation;
		this.lostPhone = lostPhone;
		this.lostType = lostType;
		this.lostGender = lostGender;
		this.lostDetail = lostDetail;
		this.lostDel = lostDel;
	}
	
	public LostPetDto(String lostDate, int lostStatus, String lostLocation, String lostPhone, int lostType,
			int lostGender, String lostDetail) {
		super();
		this.lostDate = lostDate;
		this.lostStatus = lostStatus;
		this.lostLocation = lostLocation;
		this.lostPhone = lostPhone;
		this.lostType = lostType;
		this.lostGender = lostGender;
		this.lostDetail = lostDetail;
	}

	public int getLostSeq() {
		return lostSeq;
	}

	public void setLostSeq(int lostSeq) {
		this.lostSeq = lostSeq;
	}

	public String getLostId() {
		return lostId;
	}

	public void setLostId(String lostId) {
		this.lostId = lostId;
	}

	public String getLostDate() {
		return lostDate;
	}

	public void setLostDate(String lostDate) {
		this.lostDate = lostDate;
	}

	public int getLostViewcount() {
		return lostViewcount;
	}

	public void setLostViewcount(int lostViewcount) {
		this.lostViewcount = lostViewcount;
	}

	public int getLostStatus() {
		return lostStatus;
	}

	public void setLostStatus(int lostStatus) {
		this.lostStatus = lostStatus;
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
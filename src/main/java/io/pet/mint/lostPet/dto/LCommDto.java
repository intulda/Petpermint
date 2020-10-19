package io.pet.mint.lostPet.dto;

public class LCommDto {

	private int lostpetSeq;
	private int lcommSeq;
	private String lcommId;
	private String lcommDate;
	private String lcommContent;
	private int lcommRef;
	private int lcommStep;
	private int lcommDepth;
	private int lcommDel;
	
	public LCommDto() {
		// TODO Auto-generated constructor stub
	}

	public LCommDto(int lostpetSeq, int lcommSeq, String lcommId, String lcommDate, String lcommContent, int lcommRef,
			int lcommStep, int lcommDepth, int lcommDel) {
		super();
		this.lostpetSeq = lostpetSeq;
		this.lcommSeq = lcommSeq;
		this.lcommId = lcommId;
		this.lcommDate = lcommDate;
		this.lcommContent = lcommContent;
		this.lcommRef = lcommRef;
		this.lcommStep = lcommStep;
		this.lcommDepth = lcommDepth;
		this.lcommDel = lcommDel;
	}

	public int getLostpetSeq() {
		return lostpetSeq;
	}

	public void setLostpetSeq(int lostpetSeq) {
		this.lostpetSeq = lostpetSeq;
	}

	public int getLcommSeq() {
		return lcommSeq;
	}

	public void setLcommSeq(int lcommSeq) {
		this.lcommSeq = lcommSeq;
	}

	public String getLcommId() {
		return lcommId;
	}

	public void setLcommId(String lcommId) {
		this.lcommId = lcommId;
	}

	public String getLcommDate() {
		return lcommDate;
	}

	public void setLcommDate(String lcommDate) {
		this.lcommDate = lcommDate;
	}

	public String getLcommContent() {
		return lcommContent;
	}

	public void setLcommContent(String lcommContent) {
		this.lcommContent = lcommContent;
	}

	public int getLcommRef() {
		return lcommRef;
	}

	public void setLcommRef(int lcommRef) {
		this.lcommRef = lcommRef;
	}

	public int getLcommStep() {
		return lcommStep;
	}

	public void setLcommStep(int lcommStep) {
		this.lcommStep = lcommStep;
	}

	public int getLcommDepth() {
		return lcommDepth;
	}

	public void setLcommDepth(int lcommDepth) {
		this.lcommDepth = lcommDepth;
	}

	public int getLcommDel() {
		return lcommDel;
	}

	public void setLcommDel(int lcommDel) {
		this.lcommDel = lcommDel;
	}

	@Override
	public String toString() {
		return "LCommDto [lostpetSeq=" + lostpetSeq + ", lcommSeq=" + lcommSeq + ", lcommId=" + lcommId + ", lcommDate="
				+ lcommDate + ", lcommContent=" + lcommContent + ", lcommRef=" + lcommRef + ", lcommStep=" + lcommStep
				+ ", lcommDepth=" + lcommDepth + ", lcommDel=" + lcommDel + "]";
	}
}
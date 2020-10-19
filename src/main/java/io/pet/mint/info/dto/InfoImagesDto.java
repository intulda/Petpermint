package io.pet.mint.info.dto;

import java.io.Serializable;
import java.util.Arrays;

public class InfoImagesDto implements Serializable {

	private int imagesSeq;
	private int BoardSeq;
	private byte[] imagesPath;
	private String contents;
	private String regId;
	private String regDate;
	
	
	public InfoImagesDto() {}


	public InfoImagesDto(int imagesSeq, int boardSeq, byte[] imagesPath, String contents, String regId,
			String regDate) {
		super();
		this.imagesSeq = imagesSeq;
		BoardSeq = boardSeq;
		this.imagesPath = imagesPath;
		this.contents = contents;
		this.regId = regId;
		this.regDate = regDate;
	}


	public int getImagesSeq() {
		return imagesSeq;
	}


	public void setImagesSeq(int imagesSeq) {
		this.imagesSeq = imagesSeq;
	}


	public int getBoardSeq() {
		return BoardSeq;
	}


	public void setBoardSeq(int boardSeq) {
		BoardSeq = boardSeq;
	}


	public byte[] getImagesPath() {
		return imagesPath;
	}


	public void setImagesPath(byte[] imagesPath) {
		this.imagesPath = imagesPath;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getRegId() {
		return regId;
	}


	public void setRegId(String regId) {
		this.regId = regId;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	@Override
	public String toString() {
		return "InfoImagesDto [imagesSeq=" + imagesSeq + ", BoardSeq=" + BoardSeq + ", imagesPath="
				+ Arrays.toString(imagesPath) + ", contents=" + contents + ", regId=" + regId + ", regDate=" + regDate
				+ "]";
	}

	
	
}

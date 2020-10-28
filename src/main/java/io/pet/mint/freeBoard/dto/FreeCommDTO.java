package io.pet.mint.freeBoard.dto;

import java.io.Serializable;

public class FreeCommDTO implements Serializable {

	private int commSeq;
	private int commRef;
	
	private String commContents;
	private String commRegId;
	private String commRegDate;
	private String commUpdate;
	
	public FreeCommDTO() {
		
	}

	public int getCommSeq() {
		return commSeq;
	}

	public void setCommSeq(int commSeq) {
		this.commSeq = commSeq;
	}

	public int getCommRef() {
		return commRef;
	}

	public void setCommRef(int commRef) {
		this.commRef = commRef;
	}

	public String getCommContents() {
		return commContents;
	}

	public void setCommContents(String commContents) {
		this.commContents = commContents;
	}

	public String getCommRegId() {
		return commRegId;
	}

	public void setCommRegId(String commRegId) {
		this.commRegId = commRegId;
	}

	public String getCommRegDate() {
		return commRegDate;
	}

	public void setCommRegDate(String commRegDate) {
		this.commRegDate = commRegDate;
	}

	public String getCommUpdate() {
		return commUpdate;
	}

	public void setCommUpdate(String commUpdate) {
		this.commUpdate = commUpdate;
	}

	public FreeCommDTO(int commSeq, int commRef, String commContents, String commRegId, String commRegDate,
			String commUpdate) {
		super();
		this.commSeq = commSeq;
		this.commRef = commRef;
		this.commContents = commContents;
		this.commRegId = commRegId;
		this.commRegDate = commRegDate;
		this.commUpdate = commUpdate;
	}

	@Override
	public String toString() {
		return "FreeCommDTO [commSeq=" + commSeq + ", commRef=" + commRef + ", commContents=" + commContents
				+ ", commRegId=" + commRegId + ", commRegDate=" + commRegDate + ", commUpdate=" + commUpdate + "]";
	}

	
	
}

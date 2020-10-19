package io.pet.mint.placeBoard.dto;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PlaceCommDto implements Serializable {
	
	private int commSeq;			// 댓글 시퀀스 번호
	private int commDel;			// 댓글 삭제 유무
	
	// 보낼 데이터
	private int commRef;			// 댓글 그룹번호
	private String commContent;		// 댓글 내용
	private String commRegId;		// 댓글 작성자
	
	private String commRegDate;		// 댓글 등록일
	private String commUpdDate;		// 댓글 수정일
	
	public PlaceCommDto() {
	}

	public PlaceCommDto(int commSeq, int commRef, int commDel, String commContent, String regId, String commRegId,
			String commRegDate, String commUpdDate) {
		super();
		this.commSeq = commSeq;
		this.commRef = commRef;
		this.commDel = commDel;
		this.commContent = commContent;
		this.commRegId = commRegId;
		this.commRegDate = commRegDate;
		this.commUpdDate = commUpdDate;
	}
	
	
}

package io.pet.mint.placeBoard.dto;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PlaceCommParam implements Serializable {
	
	// 페이지 변경시 저장할 변수
	private int pageNumber = 0;				// 현재 페이지
	private int recordCountPerPage = 10;	// 표현할 페이지의 글수	
	private int start = 1;					// 시작 rnum
	private int end = 10;					// 끝 rum
	
	private int commRef;
	
	public PlaceCommParam() {
	}

	public PlaceCommParam(int pageNumber, int recordCountPerPage, int start, int end, int commRef) {
		super();
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
		this.commRef = commRef;
	}

	
	
}

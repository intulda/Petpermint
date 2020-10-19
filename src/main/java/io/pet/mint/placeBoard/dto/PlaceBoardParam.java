package io.pet.mint.placeBoard.dto;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PlaceBoardParam implements Serializable {
	
	//검색시 저장할 변수
	private String keyword;					// 검색 키워드
	private String category;				// 검색 항목
	
	// 셀렉트태그에서 항목을 변경할 때 저장할 변수
	private String boardCategory;
	
	// 페이지 변경시 저장할 변수
	private int pageNumber = 0;				// 현재 페이지
	private int recordCountPerPage = 10;	// 표현할 페이지의 글수	
	private int start = 1;					// 시작 rnum
	private int end = 10;					// 끝 rum
	
	public PlaceBoardParam() {}

	public PlaceBoardParam(int pageNumber, int recordCountPerPage, int start, int end) {
		super();
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}
	
}

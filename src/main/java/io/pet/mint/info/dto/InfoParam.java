package io.pet.mint.info.dto;

import java.io.Serializable;

public class InfoParam implements Serializable {
	
	  //검색시 저장할 변수
	   private String keyword;
	   private String category;
	   private String choice;
	   
	   // 페이지 변경시 저장할 변수
	   private int pageNumber = 0;   // 현재 페이지
	   private int recordCountPerPage = 10;   // 표현할 페이지의 글수   
	   private int start = 1;
	   private int end = 10;

	   private String boardType;	// 백과, 푸드, 훈련
	
	   public InfoParam() {
		
	   }

	public InfoParam(String keyword, String category, int pageNumber, int recordCountPerPage, int start, int end,
			String boardType) {
		super();
		this.keyword = keyword;
		this.category = category;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
		this.boardType = boardType;
	}
	
	
	public InfoParam(String keyword, String category, String choice, int pageNumber, int recordCountPerPage, int start,
			int end, String boardType) {
		super();
		this.keyword = keyword;
		this.category = category;
		this.choice = choice;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
		this.boardType = boardType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	@Override
	public String toString() {
		return "InfoParam [keyword=" + keyword + ", category=" + category + ", choice=" + choice + ", pageNumber="
				+ pageNumber + ", recordCountPerPage=" + recordCountPerPage + ", start=" + start + ", end=" + end
				+ ", boardType=" + boardType + "]";
	}


}

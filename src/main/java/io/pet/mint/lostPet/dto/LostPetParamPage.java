package io.pet.mint.lostPet.dto;

import java.io.Serializable;

public class LostPetParamPage implements Serializable {

	// 검색
	private String searchWord;
	private String choice;
	
	// 페이징
	private int nowPage;				// 현재 페이지
	private int recordCountPerPage;		// 표현할 페이지 수
	
	private int start = 1;
	private int end = 10;
	
	public LostPetParamPage() {
	}

	public LostPetParamPage(String searchWord, String choice, int nowPage, int recordCountPerPage, int start, int end) {
		super();
		this.searchWord = searchWord;
		this.choice = choice;
		this.nowPage = nowPage;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
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

	@Override
	public String toString() {
		return "BbsParamPage [searchWord=" + searchWord + ", choice=" + choice + ", nowPage=" + nowPage
				+ ", recordCountPerPage=" + recordCountPerPage + ", start=" + start + ", end=" + end + "]";
	}
	
}






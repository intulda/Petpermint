package io.pet.mint.freeBoard.dto;

import java.io.Serializable;

public class FreeBoardParam implements Serializable {
	
	//검색기능
	private String searchWord;
	private String choice;
	
	//페이지
	private int nowPage = 0;		//현제 페이지
	private int CountPerPage = 10;	//표현할 페이지 수
	
	private int start = 1;
	private int end = 10;
	
	public FreeBoardParam() {
		
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
	public int getCountPerPage() {
		return CountPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		CountPerPage = countPerPage;
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
		return "FreeBoardParam [searchWord=" + searchWord + ", choice=" + choice + ", nowPage=" + nowPage
				+ ", CountPerPage=" + CountPerPage + ", start=" + start + ", end=" + end
				+ "]";
	}

	public FreeBoardParam(String searchWord, String choice, int nowPage, int countPerPage, int start,
			int end) {
		super();
		this.searchWord = searchWord;
		this.choice = choice;
		this.nowPage = nowPage;
		CountPerPage = countPerPage;
		this.start = start;
		this.end = end;
	}
	
	
}

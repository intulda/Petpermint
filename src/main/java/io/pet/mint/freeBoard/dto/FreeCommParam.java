package io.pet.mint.freeBoard.dto;

import java.io.Serializable;

public class FreeCommParam implements Serializable {

	private int pageNumber = 0;
	private int countPerPage = 10;
	private int start = 1;
	private int end = 10;
	
	private int commRef;
	
	public FreeCommParam() {
		
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
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

	public int getCommRef() {
		return commRef;
	}

	public void setCommRef(int commRef) {
		this.commRef = commRef;
	}

	@Override
	public String toString() {
		return "FreeCommParam [pageNumber=" + pageNumber + ", countPerPage=" + countPerPage + ", start=" + start
				+ ", end=" + end + ", commRef=" + commRef + "]";
	}

	public FreeCommParam(int pageNumber, int countPerPage, int start, int end, int commRef) {
		super();
		this.pageNumber = pageNumber;
		this.countPerPage = countPerPage;
		this.start = start;
		this.end = end;
		this.commRef = commRef;
	}

	
	
}

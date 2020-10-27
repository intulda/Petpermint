package io.pet.mint.freeBoard.dto;

import java.io.Serializable;

public class FreeLikeDTO implements Serializable {
	
	private int boardLikeSeq;
	private int boardSeq;
	private String id;
	private int boardLikeCount;
	
	public FreeLikeDTO() {
		
	}

	public int getBoardLikeCount() {
		return boardLikeCount;
	}


	public void setBoardLikeCount(int boardLikeCount) {
		this.boardLikeCount = boardLikeCount;
	}


	public int getBoardLikeSeq() {
		return boardLikeSeq;
	}

	public void setBoardLikeSeq(int boardLikeSeq) {
		this.boardLikeSeq = boardLikeSeq;
	}

	public int getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}

	public String getid() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "FreeLikeDTO [boardLikeSeq=" + boardLikeSeq + ", boardSeq=" + boardSeq + ", id=" + id
				+ ", boardLikeCount=" + boardLikeCount + "]";
	}

	public FreeLikeDTO(int boardLikeSeq, int boardSeq, String id, int boardLikeCount) {
		super();
		this.boardLikeSeq = boardLikeSeq;
		this.boardSeq = boardSeq;
		this.id = id;
		this.boardLikeCount = boardLikeCount;
	}

	

	
}

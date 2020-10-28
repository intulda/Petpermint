package io.pet.mint.freeBoard.dto;

import java.io.Serializable;

public class FreeBoardDTO implements Serializable {

	private int boardSeq;
	private String boardRegId;
	private String boardTitle;
	private String boardContents;
	private String id;
	
	private String boardRegDate;
	private String boardUpdDate;
	
	private int boardLikeSeq;
	private int boardViewCount;
	
	private String boardNoticeYn;
	
	public FreeBoardDTO() {
	}
	
	public String getBoardContents() {
		return boardContents;
	}

	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}

	public String getBoardRegId() {
		return boardRegId;
	}

	public void setBoardRegId(String boardRegId) {
		this.boardRegId = boardRegId;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardRegDate() {
		return boardRegDate;
	}

	public void setBoardRegDate(String boardRegDate) {
		this.boardRegDate = boardRegDate;
	}

	public String getBoardUpdDate() {
		return boardUpdDate;
	}

	public void setBoardUpdDate(String boardUpdDate) {
		this.boardUpdDate = boardUpdDate;
	}

	public int getBoardLikeSeq() {
		return boardLikeSeq;
	}

	public void setBoardLikeSeq(int boardLikeSeq) {
		this.boardLikeSeq = boardLikeSeq;
	}

	public int getBoardViewCount() {
		return boardViewCount;
	}

	public void setBoardViewCount(int boardViewCount) {
		this.boardViewCount = boardViewCount;
	}

	public String getBoardNoticeYn() {
		return boardNoticeYn;
	}

	public void setBoardNoticeYn(String boardNoticeYn) {
		this.boardNoticeYn = boardNoticeYn;
	}

	@Override
	public String toString() {
		return "FreeBoardDTO [boardSeq=" + boardSeq + ", boardRegId=" + boardRegId + ", boardTitle=" + boardTitle
				+ ", boardContents=" + boardContents + ", id=" + id + ", boardRegDate=" + boardRegDate
				+ ", boardUpdDate=" + boardUpdDate + ", boardLikeSeq=" + boardLikeSeq + ", boardViewCount="
				+ boardViewCount + ", boardNoticeYn=" + boardNoticeYn + "]";
	}

	public FreeBoardDTO(int boardSeq, String boardRegId, String boardTitle, String boardContents, String id,
			String boardRegDate, String boardUpdDate, int boardLikeSeq, int boardViewCount, String boardNoticeYn) {
		super();
		this.boardSeq = boardSeq;
		this.boardRegId = boardRegId;
		this.boardTitle = boardTitle;
		this.boardContents = boardContents;
		this.id = id;
		this.boardRegDate = boardRegDate;
		this.boardUpdDate = boardUpdDate;
		this.boardLikeSeq = boardLikeSeq;
		this.boardViewCount = boardViewCount;
		this.boardNoticeYn = boardNoticeYn;
	}

	

	
	
}

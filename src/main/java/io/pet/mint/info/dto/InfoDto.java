package io.pet.mint.info.dto;

import java.io.Serializable;

public class InfoDto implements Serializable {
   
   
   /* 강아지 , 고양이*/
   
	
	/* 카테고리  */
	private String boardCategory;   // 4 dog, cat
	   
   /* 게시판 타입 */
   private String boardType;  // 백과,음식,행동
   
   /* 시퀀스, FK*/
   private int boardSeq;    // 2  글 순서
   private String id;   // 7 fk키
   
   /* 댓글 */
   private int boardRef;    // 15
   private int boardStep;    // 16
   private int boardDepth; // 17
   
   /* 글 내용 */
   private String boardRegId;   //처음 글쓴 계정  11
   private String boardTitle;    //제목         5
   private String boardContents;      //내용         6 
   private String boardRegDate; //날자         12   
   
   /* 글 수정 : 업데이트 한 아이디 , 업데이트 된 날짜*/
   private String boardUpdId;   // 13      
   private String boardUpdDate;   // 14
   
   /* 조회수 */
   private int boardViewCount; // 10   
   
   /* 삭제 */
   private int boardDel;
   
   /*이미지*/
   private byte[] imagesPath;
   private String filePath;
   
   
   
   public InfoDto() {
	   }

public InfoDto(String boardType, String boardCategory, int boardSeq, String id, int boardRef, int boardStep,
		int boardDepth, String boardRegId, String boardTitle, String boardContents, String boardRegDate,
		String boardUpdId, String boardUpdDate, int boardViewCount, int boardDel, String filePath) {
	super();
	this.boardType = boardType;
	this.boardCategory = boardCategory;
	this.boardSeq = boardSeq;
	this.id = id;
	this.boardRef = boardRef;
	this.boardStep = boardStep;
	this.boardDepth = boardDepth;
	this.boardRegId = boardRegId;
	this.boardTitle = boardTitle;
	this.boardContents = boardContents;
	this.boardRegDate = boardRegDate;
	this.boardUpdId = boardUpdId;
	this.boardUpdDate = boardUpdDate;
	this.boardViewCount = boardViewCount;
	this.boardDel = boardDel;
	this.filePath = filePath;
}



public String getBoardType() {
	return boardType;
}

public void setBoardType(String boardType) {
	this.boardType = boardType;
}

public String getBoardCategory() {
	return boardCategory;
}

public void setBoardCategory(String boardCategory) {
	this.boardCategory = boardCategory;
}

public int getBoardSeq() {
	return boardSeq;
}

public void setBoardSeq(int boardSeq) {
	this.boardSeq = boardSeq;
}
public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}


public int getBoardRef() {
	return boardRef;
}

public void setBoardRef(int boardRef) {
	this.boardRef = boardRef;
}

public int getBoardStep() {
	return boardStep;
}

public void setBoardStep(int boardStep) {
	this.boardStep = boardStep;
}

public int getBoardDepth() {
	return boardDepth;
}

public void setBoardDepth(int boardDepth) {
	this.boardDepth = boardDepth;
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

public String getBoardContents() {
	return boardContents;
}

public void setBoardContents(String boardContents) {
	this.boardContents = boardContents;
}

public String getBoardRegDate() {
	return boardRegDate;
}

public void setBoardRegDate(String boardRegDate) {
	this.boardRegDate = boardRegDate;
}

public String getBoardUpdId() {
	return boardUpdId;
}

public void setBoardUpdId(String boardUpdId) {
	this.boardUpdId = boardUpdId;
}

public String getBoardUpdUate() {
	return boardUpdDate;
}

public void setBoardUpdUate(String boardUpdUate) {
	this.boardUpdDate = boardUpdUate;
}

public int getBoardViewCount() {
	return boardViewCount;
}

public void setBoardViewCount(int boardViewCount) {
	this.boardViewCount = boardViewCount;
}

public String getFilePath() {
	return filePath;
}

public void setFilePath(String filePath) {
	this.filePath = filePath;
}

public String getBoardUpdDate() {
	return boardUpdDate;
}

public void setBoardUpdDate(String boardUpdDate) {
	this.boardUpdDate = boardUpdDate;
}

public int getBoardDel() {
	return boardDel;
}

public void setBoardDel(int boardDel) {
	this.boardDel = boardDel;
}


public byte[] getImagesPath() {
	return imagesPath;
}

public void setImagesPath(byte[] imagesPath) {
	this.imagesPath = imagesPath;
}

@Override
public String toString() {
	return "InfoDto [boardType=" + boardType + ", boardCategory=" + boardCategory + ", boardSeq=" + boardSeq + ", id="
			+ id + ", boardRef=" + boardRef + ", boardStep=" + boardStep + ", boardDepth=" + boardDepth
			+ ", boardRegId=" + boardRegId + ", boardTitle=" + boardTitle + ", boardContents=" + boardContents
			+ ", boardRegDate=" + boardRegDate + ", boardUpdId=" + boardUpdId + ", boardUpdDate=" + boardUpdDate
			+ ", boardViewCount=" + boardViewCount + ", boardDel=" + boardDel + ", filePath=" + filePath + "]";
}





   }

   
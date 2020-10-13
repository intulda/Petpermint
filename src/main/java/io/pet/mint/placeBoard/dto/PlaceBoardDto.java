package io.pet.mint.placeBoard.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PlaceBoardDto implements Serializable {
	
	
	// 글쓰기 페이지 입력데이터
	private String boardCategory;	// 카테고리 : 동물병원, 애견카페, 카페, 음식점
	private String boardTitle;		// 제목이 아닌 장소의 명칭
	private String boardContents;	// 내용 : 썸머노트 api를 이용했기 때문에 html태그로 내용을 저장
	private String boardLocation;	// 장소 주소
	
	
	private int boardSeq; // 게시판 시퀀스
	private String boardType;	// 게시판 유형
	
	private String imagePath;		// 썸네일 이미지 경로명
	
	private String id;	 // 작성자id
	private String boardRegId;		// 작성자id
	private String boardRegDate;		// 작성날짜
	private String boardUpdId;		// 	수정자id
	private String boardUpdDate;		// 수정날짜
	
	private int BoardviewCount;		// 조회수
	private int boardRef;		// 게시물 그룹번호
	
	
	public PlaceBoardDto() {}


	public PlaceBoardDto(String boardCategory, String boardTitle, String boardContents, String boardLocation,
			int boardSeq, String boardType, String imagePath, String id, String boardRegId, String boardRegDate,
			String boardUpdId, String boardUpdDate, int boardviewCount, int boardRef) {
		super();
		this.boardCategory = boardCategory;
		this.boardTitle = boardTitle;
		this.boardContents = boardContents;
		this.boardLocation = boardLocation;
		this.boardSeq = boardSeq;
		this.boardType = boardType;
		this.imagePath = imagePath;
		this.id = id;
		this.boardRegId = boardRegId;
		this.boardRegDate = boardRegDate;
		this.boardUpdId = boardUpdId;
		this.boardUpdDate = boardUpdDate;
		BoardviewCount = boardviewCount;
		this.boardRef = boardRef;
	}


	
	
	
	
}

package io.pet.mint.placeBoard.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@ToString
public class PlaceBoardDto implements Serializable {
	
	private int boardSeq;
	private String boardType;
	private String boardCategory;
	private String boardTitle;
	private String boardContents;
	private String imagePath;
	
	private String id;
	private String boardLocation;
	private int BoardviewCount;
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private int boardRef;
	
	
	public PlaceBoardDto() {}
	
	
	
}

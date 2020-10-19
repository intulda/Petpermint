<<<<<<< HEAD
package io.pet.mint.lostPet.dto;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LostPetParam implements Serializable {
	
	//검색시 저장할 변수
	private String keyword;
	private String category;
	
	// 셀렉트태그에서 항목을 변경할 때 저장할 변수
	private String boardCategory;
	
	// 페이지 변경시 저장할 변수
	private int pageNumber = 0;	// 현재 페이지
	private int recordCountPerPage = 9;	// 표현할 페이지의 글수	
	private int start = 1;
	private int end = 10;
	
	public LostPetParam() {}

	public LostPetParam(int pageNumber, int recordCountPerPage, int start, int end) {
		super();
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}
	
	
	
	
=======
package io.pet.mint.lostPet.dto;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LostPetParam implements Serializable {
	
	//검색시 저장할 변수
	private String keyword;
	private String category;
	
	// 셀렉트태그에서 항목을 변경할 때 저장할 변수
	private String boardCategory;
	
	// 페이지 변경시 저장할 변수
	private int pageNumber = 0;	// 현재 페이지
	private int recordCountPerPage = 10;	// 표현할 페이지의 글수	
	private int start = 1;
	private int end = 10;
	
	public LostPetParam() {}

	public LostPetParam(int pageNumber, int recordCountPerPage, int start, int end) {
		super();
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}	
>>>>>>> branch 'develop' of https://github.com/intulda/Petpermint
}

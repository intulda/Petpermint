package io.pet.mint.controller;

import java.io.File;
import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import io.pet.mint.placeBoard.dto.ImagesDto;
import io.pet.mint.placeBoard.dto.PlaceBoardDto;
import io.pet.mint.placeBoard.dto.PlaceBoardParam;
import io.pet.mint.placeBoard.service.ImagesService;
import io.pet.mint.placeBoard.service.PlaceBoardService;
import io.pet.mint.util.CommonUtil;

@Controller
@RequestMapping(value = "/placeBoard/*")
public class PlaceBoardController {
	
	
	@Autowired
	PlaceBoardService boardService;
	
	@Autowired
	ImagesService imageService;
	
	
	@GetMapping(value = "placeBoardList")
	public String placeBbsList() {
		
		return "view:placeBoard/placeBoardList";
	}
	/*
	@ResponseBody
	@PostMapping(value = "getPlaceBoardList")
	public String getPlaceBoardList(PlaceBoardParam param, Model model) {
		
		
	}
	*/
	@ResponseBody
	@PostMapping(value = "getPlaceBoardList")
	public List<PlaceBoardDto> getPlaceBoardList(PlaceBoardParam param) {
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = sn * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();	
		param.setStart(start);
		param.setEnd(end);

		List<PlaceBoardDto> placeList = boardService.getPlaceBoardList(param);
					
		for(PlaceBoardDto placeDto : placeList) {
					
			ImagesDto imageDto = imageService.getImages(placeDto.getBoardSeq());
			
			if(imageDto != null) {
				byte[] byteImage = imageDto.getImagesPath();
				placeDto.setImagePath(CommonUtil.imageToBase64(byteImage));
			}	
		}
			
		System.out.println("리스트 갯수:" +placeList.size());
		return placeList;
	}
	
	@ResponseBody
	@PostMapping(value = "getCount")
	public int getCount(PlaceBoardParam param) {
		int count = boardService.getCount(param);
		System.out.println("게시물 갯수: " + count);
		return count;
	}

	
	
	// 글작성페이지 이동
	@GetMapping(value = "placeBoardWriteView")
	public String placeBoardWriteView() {
		
		return "view:placeBoard/placeBoardWrite";
	}
	 
	// 글작성
	@PostMapping(value = "placeBoardWrite")
	public String placeBoardWrite(
			 PlaceBoardDto placeDto
			,@RequestParam(value = "thumbnail", required = false)MultipartFile thumbnail
				) {
		
			try {
				
				// 게시판 내용 저장
				boardService.placeBoardWrite(placeDto);
													
				ImagesDto imageDto = new ImagesDto();
				// 썸네일 이미지 이름	, 파일 저장		
				imageDto.setImagesPath(thumbnail.getBytes());
				imageService.saveImages(imageDto);
								
				return "view:placeBoard/placeBoardList";
				
			} catch (IOException e1) {
				
				e1.printStackTrace();
				return "view:placeBoard/placeBoardList";
			}		
	}
	
	// 상세페이지 이동
	@GetMapping(value = "placeBoardDetail")
	public String placeBoardDetail(String seq, Model model) {
		
		
		System.out.print(seq);
		int boardSeq = Integer.parseInt(seq);
		PlaceBoardDto placeDto = boardService.getPlaceBoardContent(boardSeq);
				
		ImagesDto imageDto = imageService.getImages(boardSeq); 
		
		if(imageDto!= null) {
			byte[] byteImage = imageDto.getImagesPath();
			placeDto.setImagePath(CommonUtil.imageToBase64(byteImage));
		}
		model.addAttribute("placeDto", placeDto);
		
		return "view:placeBoard/placeBoardDetail";
	}
	
	// 수정페이지 이동
	@GetMapping(value = "placeBoardUpdate")
	public String placeBoardUpdate(@RequestParam(value="boardSeq")int boardSeq
								,Model model) {
		
		PlaceBoardDto placeDto = boardService.getPlaceBoardContent(boardSeq);
		
		ImagesDto imageDto = imageService.getImages(boardSeq); 
		
		if(imageDto != null) {
			byte[] byteImage = imageDto.getImagesPath();
			placeDto.setImagePath(CommonUtil.imageToBase64(byteImage));
		}
				
		model.addAttribute("placeDto", placeDto);
		
		return "view:placeBoard/placeBoardUpdate";
	}
	
	
	// 글수정
	@PostMapping(value = "placeBoardUpdateAf")
	public String placeBoardUpdateAf( PlaceBoardDto placeDto
			,@RequestParam(value = "thumbnail", required = false)MultipartFile thumbnail) {
						
		try {
			
			// 게시판 내용 수정
			boardService.placeBoardUpdate(placeDto);
			
			// 수정한 썸네일이미지가 있을 경우
			if(!thumbnail.isEmpty()) {									
				ImagesDto imageDto = new ImagesDto();
				// 썸네일 파일 수정		
				imageDto.setImagesPath(thumbnail.getBytes());
				imageDto.setBoardSeq(placeDto.getBoardSeq());
				imageService.updateImages(imageDto);
			}				
			return "view:placeBoard/placeBoardList";
			
		} catch (IOException e1) {
			
			e1.printStackTrace();
			return "view:placeBoard/placeBoardList";
		}
	}
	
	@ResponseBody
	@PostMapping(value = "placeBoardDelete")
	public String placeBoardDelete(
			@RequestParam(value = "boardSeq")int boardSeq) {
		
		int check = boardService.placeBoardDelete(boardSeq);
		
		return check>0?"ok":"no";
	}
	
}









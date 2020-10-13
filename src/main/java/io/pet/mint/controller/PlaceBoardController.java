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
		System.out.println(param.getKeyword());
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

	
	
	
	@GetMapping(value = "placeBoardWriteView")
	public String placeBoardWriteView() {
		
		return "view:placeBoard/placeBoardWrite";
	}
	 
	// 글쓰기
	@PostMapping(value = "placeBoardWrite")
	public String placeBoardWrite(
			 PlaceBoardDto placeDto
			,@RequestParam(value = "thumbnail", required = false)MultipartFile thumbnail
			,HttpServletRequest req) {
		
			
		
			try {
				//byte[] image = dto.getImagesPath(); 			
				//System.out.println(placeDto.toString());
				
				// 게시판 내용 저장
				int dbCheck = boardService.placeBoardWrite(placeDto);
					
				System.out.println("게시판 확인용 " + dbCheck);
							
				ImagesDto imageDto = new ImagesDto();
				// 작성한 이미지 파일을 db에 파일형식으로 저장하기 위해서 바이트로 변환후 dto에 저장
				imageDto.setImagesPath(thumbnail.getBytes());
				// 이미지 파일저장
				dbCheck = imageService.saveImages(imageDto);
				
				System.out.println("이미지 등록 확인용 " + dbCheck);
				
				
				
				return "view:placeBoard/placeBoardList";
				
			} catch (IOException e1) {
				
				e1.printStackTrace();
				return "view:placeBoard/placeBoardList";
			}
			
	}
	
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
	
	@GetMapping(value = "placeBoardUpdate")
	public String placeBoardUpdate(@RequestParam(value="boardSeq")int boardSeq
								,Model model) {
		
		PlaceBoardDto placeDto = boardService.getPlaceBoardContent(boardSeq);
		
		ImagesDto imageDto = imageService.getImages(boardSeq); 
		
		if(imageDto!= null) {
			byte[] byteImage = imageDto.getImagesPath();
			placeDto.setImagePath(CommonUtil.imageToBase64(byteImage));
		}
		model.addAttribute("placeDto", placeDto);
		
		return "view:placeBoard/placeBoardUpdate";
	}
	
}

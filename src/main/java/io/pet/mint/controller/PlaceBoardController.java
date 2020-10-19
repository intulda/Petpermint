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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import io.pet.mint.placeBoard.dto.ImagesDto;
import io.pet.mint.placeBoard.dto.PlaceBoardDto;
import io.pet.mint.placeBoard.dto.PlaceBoardParam;
import io.pet.mint.placeBoard.dto.PlaceCommDto;
import io.pet.mint.placeBoard.dto.PlaceCommParam;
import io.pet.mint.placeBoard.service.ImagesService;
import io.pet.mint.placeBoard.service.PlaceBoardService;
import io.pet.mint.placeBoard.service.PlaceCommService;
import io.pet.mint.util.CommonUtil;

@Controller
@RequestMapping(value = "/placeBoard/*")
public class PlaceBoardController {
	
	// 게시판 서비스
	@Autowired
	PlaceBoardService boardService;
	// 이미지 서비스
	@Autowired
	ImagesService imageService;
	// 댓글 서비스
	@Autowired
	PlaceCommService commService;
	
	
	
	/*---------------- 게시물 컨트롤러 ----------------*/
	
	
	// 게시판페이지 이동
	@GetMapping(value = "placeBoardList")
	public String placeBbsList() {
		
		return "view:placeBoard/placeBoardList";
	}
	
	// 게시물페이지에서 게시물리스트 출력
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
	
	// 게시물 카운팅
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
	 
	// 글 작성
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
	public String placeBoardDetail(@RequestParam(value = "seq")int boardSeq, 
									Model model) {
		
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
	
	// 글삭제
	@ResponseBody
	@PostMapping(value = "placeBoardDelete")
	public String placeBoardDelete(
			@RequestParam(value = "boardSeq")int boardSeq) {
		
		int check = boardService.placeBoardDelete(boardSeq);
		
		return check>0?"ok":"no";
	}
	
	
	
	
	/*---------------- 댓글 컨트롤러 ----------------*/
	
	
	// 댓글 등록
	@ResponseBody
	@PostMapping(value = "placeCommWrite")
	public String placeCommWrite(PlaceCommDto commDto) {
		
		System.out.println(commDto.toString());
		int n = commService.placeCommWrite(commDto);
		
		return n>0?"ok":"no";
	}
	
	// 댓글 출력
	@ResponseBody
	@PostMapping(value = "getCommList")
	public List<PlaceCommDto> getCommList(PlaceCommParam param){
		
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = sn * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();	
		param.setStart(start);
		param.setEnd(end);
		
		List<PlaceCommDto> list = commService.getCommList(param);
		
		System.out.println(list);
		return list;
	}
	
	//댓글 갯수 카운팅
	@ResponseBody
	@PostMapping(value = "getCommCount")
	public int getCommCount(PlaceCommParam param){
		int count = commService.getCommCount(param.getCommRef());
		System.out.println("댓글 갯수: " + count);
		return count;
	}
	
	// 댓글 수정
	@ResponseBody
	@PostMapping(value = "PlaceCommUpdate")
	public String PlaceCommUpdate(PlaceCommDto commDto) {
		
		int check = commService.placeCommUpdate(commDto);
		System.out.println("수정 결과: " + check);
		
		return check>0?"ok":"no";
	}
	
	// 댓글 삭제
	@ResponseBody
	@PostMapping( value = "PlaceCommDelete")
	public String PlaceCommDelete(int commSeq) {
		
		int check = commService.placeCommDelete(commSeq);
		System.out.println("수정 결과: " + check);
		
		return check>0?"ok":"no";
	}
	
	
	
	/*---------------- 맵 컨트롤러 ----------------*/
	
	
	@GetMapping( value = "placeBoardMap")
	public String placeBoardMap() {
		
		return "view:placeBoard/placeBoardMap";
	}
}

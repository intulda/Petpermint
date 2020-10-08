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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import io.pet.mint.placeBoard.dto.ImagesDto;
import io.pet.mint.placeBoard.dto.PlaceBoardDto;
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
	
	
	@GetMapping(value = "placeBoardWriteView")
	public String placeBoardWriteView() {
		
		return "view:placeBoard/placeBoardWrite";
	}
	 
	
	@PostMapping(value = "placeBoardWrite")
	public String placeBoardWrite(PlaceBoardDto placeDto
			,@RequestParam(value = "thumbnail", required = false)MultipartFile thumbnail
			,HttpServletRequest req) {
		
		
			try {
				
				ImagesDto imagedto = new ImagesDto();
				imagedto.setImagesPath(thumbnail.getBytes());
				
				int n = imageService.saveImages(imagedto);
				
				System.out.println(n);
				
				
				
				return null;
				
			} catch (IOException e1) {
				
				e1.printStackTrace();
			}
		
		
		//byte[] image = dto.getImagesPath(); 
		
		
		
		//int n = service.placeBoardWrite(placeDto);
			
		//System.out.println("확인용" + n);
		//return "view:placeBoard/placeBoardList";
		return null;
	}
	
	@GetMapping(value = "placeBoardDetail")
	public String placeBoardDetail(Model model) {
		
		PlaceBoardDto placeDto = boardService.getPlaceBoardContent(5);
		System.out.print(placeDto.toString());
		
		ImagesDto imageDto = imageService.getImages(100); 
		System.out.print(imageDto.toString());
		
		byte[] byteImage = imageDto.getImagesPath();
		placeDto.setImagePath(CommonUtil.imageToBase64(byteImage));
		
		model.addAttribute("placeDto", placeDto);
		
		return "view:placeBoard/placeBoardDetail";
	}
	
}

package io.pet.mint.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import io.pet.mint.placeBoard.dto.PlaceBoardDto;
import io.pet.mint.placeBoard.service.PlaceBoardService;

@Controller
@RequestMapping(value = "/placeBoard/*")
public class PlaceBoardController {
	
	
	@Autowired
	PlaceBoardService service;
	
	@GetMapping(value = "placeBoardList")
	public String placeBbsList() {
		
		return "view:placeBoard/placeBoardList";
	}
	
	
	@GetMapping(value = "placeBoardWriteView")
	public String placeBoardWriteView() {
		
		return "view:placeBoard/placeBoardWrite";
	}
	 
	
	@PostMapping(value = "placeBoardWrite")
	public String placeBoardWrite(PlaceBoardDto placeDto) {
		
		System.out.println(placeDto.toString());
		int n = service.placeBoardWrite(placeDto);
		System.out.println("확인용" + n);
		return "view:placeBoard/placeBoardList";
	}
	
	@GetMapping(value = "placeBoardDetail")
	public String placeBoardDetail(Model model) {
		
		PlaceBoardDto dto = service.getPlaceBoardContent(5);
		System.out.print(dto.toString());
		
		
		
		model.addAttribute("placeDto", dto);
		return "view:placeBoard/placeBoardDetail";
	}
	
}

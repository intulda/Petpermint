package io.pet.mint.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import io.pet.mint.lostPet.dto.LCommDto;
import io.pet.mint.lostPet.dto.LostPetDto;
import io.pet.mint.lostPet.service.LostPetService;

@Controller
@RequestMapping(value="/lostPet/*")
public class LostPetController {

	@Autowired
	LostPetService service;
	
	@GetMapping(value="lostPet") 
	public String getLostPetList(Model model) {
		
		System.out.println("LostPetController getLostPetList");
	
		List<LostPetDto> list = service.getLostPetList();
		System.out.println(list);
		model.addAttribute("list", list);
	
		return "view:lostPet/lostPet";
	}
	
	@GetMapping(value="lostPetDetail")
	public String getLostPetDetail(int seq, Model model) {
		//글 상세
		LostPetDto lostPetDto = service.getLostPetDetail(seq);
		System.out.println(lostPetDto);
		model.addAttribute("lostPetDto", lostPetDto);
		//뷰카운트
		int getLostViewcount = service.getLostViewcount(seq);
		model.addAttribute("getLostViewcount", getLostViewcount);
		//댓글 불러오기
		List<LCommDto> LCommList = service.getLCommList(seq);
		System.out.println(LCommList);
		model.addAttribute("LCommList", LCommList);
		//댓글 적기 Ajax
		//댓글
		/*
		 * LCommDto lcommDto = service.getLCommDto(seq);
		 * System.out.println(lcommDto.toString()); model.addAttribute("lcommDto",
		 * lcommDto);
		 */
		
		return "view:lostPet/lostPetDetail";
	}
	
	@GetMapping(value="lostPetWrite")
	public String lostPetWrite(Model model) {
		
		return "view:lostPet/lostPetWrite";
	}
	
	@ResponseBody
	@PostMapping(value = "lostPetWriteAf")
	public String lostPetWriteAf(LostPetDto lostPetDto, Model model) throws Exception {
		
		int n = service.getLostPetWrite(lostPetDto);
		
		return n>0?"ok":"no";
	}
	
	@ResponseBody
	@PostMapping(value = "lostPetLCommWriteAf")
	public String lostPetLCommWriteAf(LCommDto lcommDto, Model model) throws Exception {
		System.out.println("lostPetLCommWriteAf 도착" + lcommDto.getLcommSeq());
		int n = service.getLostPetLCommWrite(lcommDto);
		
		return n>0?"ok":"no";
	}
	
	/*
	@ResponseBody
	@PostMapping(value = "LCommUpdateAf")
	public String LCommUpdateAf(LCommDto lcommDto, Model model) throws Exception {
		System.out.println("lcommUpdateAf 도착" + lcommDto.getLcommSeq());
		int n = service.getLCommUpdate(lcommDto);
		
		return n>0?"ok":"no";
	}
	*/
		
	@GetMapping(value="lostPetUpdate")
	public String getLostPetUpdate(int seq, Model model) {
		
		LostPetDto lostPetDto = service.getLostPetDetail(seq);
		System.out.println(lostPetDto);
		model.addAttribute("lostPetDto", lostPetDto);
		
		return "view:lostPet/lostPetUpdate";
	}
	
	
	@ResponseBody
	@PostMapping(value = "lostPetUpdateAf")
	public String lostPetUpdateAf(LostPetDto dto, Model model) throws Exception {
		
		int n = service.getLostPetUpdate(dto);
		
		return n>0?"ok":"no";
	}
	
	
	@GetMapping(value="lostPetDelete")
	public String getLostPetDelete(int lcommSeq, Model model) {
			
		service.getLostPetDelete(lcommSeq);
		return "redirect:lostPet";	
	}
	
	@ResponseBody
	@PostMapping(value="lcommDel")
	public String getLCommDel(int lcommSeq, int lostpetSeq, Model model) {
		System.out.println("lcommDel Controrller"+lcommSeq+","+lostpetSeq);
		
		int n = service.getLCommDel(lcommSeq);

		return n>0?"ok":"no";
	}

	@GetMapping(value="lcommUpdate")
	public String getLCommUpdate(int seq, Model model) {
		
		LCommDto dto = service.getLCommDto(seq);
		System.out.println(dto);
		model.addAttribute("dto", dto);
		
		return "lostPet/lcommUpdate";
		
	}

	@ResponseBody
	@PostMapping(value = "lcommUpdateAf")
	public String lcommUpdateAf(LCommDto dto, Model model) throws Exception {
		
		int n = service.getLCommUpdate(dto);
		
		return n>0?"ok":"no";
	}
	
	
}

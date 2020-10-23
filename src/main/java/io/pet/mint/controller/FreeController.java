package io.pet.mint.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.pet.mint.freeBoard.dto.FreeBoardDTO;
import io.pet.mint.freeBoard.dto.FreeBoardParam;
import io.pet.mint.freeBoard.service.FreeBoardService;

@Controller
@RequestMapping(value="/freeBoard/*")
public class FreeController {
	
	@Autowired
	FreeBoardService service;
	
	@GetMapping(value="freeBoardViews")
	public String freeBoardViews(Model model) {
		
		List<FreeBoardDTO> list = service.getFreeBoardList();
		model.addAttribute("getFreeBoardList", list);
	//	System.out.println(list);
		return "view:freeBoard/freeBoard";
	}
	
	@GetMapping(value="freeWrite")
	public String freeWrite() {
		return "view:freeBoard/freeWrite";
	}
	
	@GetMapping(value="freeDetail")
	public String freeDetail(Model model, String boardSeq) {
	
		FreeBoardDTO dto = service.freeDetail(Integer.parseInt(boardSeq));
		
		model.addAttribute("dto", dto);
		//System.out.println(dto);
		return "view:freeBoard/freeDetail";
	}
	
	@ResponseBody
	@PostMapping(value="addFreeBoardPage")
	public String addFreeBoardPage(FreeBoardDTO dto) {
		//System.out.println(dto.toString());
		int n = service.addFreeBoardPage(dto);
	//	System.out.println("등록게시물갯수"+n);
		
		return n>0?"ok":"no";
	}
	
	@GetMapping(value="getFreeBoardList")
	public String getFreeBoardList(Model model){
		
		List<FreeBoardDTO> list = service.getFreeBoardList();
				
		model.addAttribute("getFreeBoardList", list);
		
		return "view:freeBoard/freeBoard";
	}
	
	@ResponseBody
	@PostMapping(value="freeBoardSearch")
	public List<FreeBoardDTO> freeBoardSearch(FreeBoardParam par){
		
		int sn = par.getNowPage() - 1;	// 0 1 2
		int start = sn * par.getCountPerPage() + 1;	// 1  11 21 
		int end = (sn + 1) * par.getCountPerPage();	// 10 20 30
		
		par.setStart(start);
		par.setEnd(end);
		
		List<FreeBoardDTO> list = service.freeBoardSearch(par);
		
		return list;
	}
	
	@ResponseBody
	@GetMapping(value="freeBoardPaging")
	public int freeBoardPaging(FreeBoardParam par) {
		
		int n = service.freeBoardPaging(par);
		return n;
	}
	
	@ResponseBody
	@PostMapping(value="freeBoardDelete")
	public String freeBoardDelete(
			@RequestParam(value="boardSeq") int boardSeq) {
		
		int check = service.freeBoardDelete(boardSeq);
		
		return check>0?"ok" : "no";
	}
	
	@GetMapping(value="freeBoardUpdateView")
	public String freeBoardUpdateView(Model model, String boardSeq) {
		
		FreeBoardDTO dto = service.freeDetail(Integer.parseInt(boardSeq));
		
		model.addAttribute("dto", dto);
		
		return "view:freeBoard/freeBoardUpdate";
	}
	
	@ResponseBody
	@PostMapping(value="freeBoardUpdate")
	public String freeBoardUpdate(FreeBoardDTO dto) {
		return null;
	}

}
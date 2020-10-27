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
import io.pet.mint.freeBoard.dto.FreeCommDTO;
import io.pet.mint.freeBoard.dto.FreeCommParam;
import io.pet.mint.freeBoard.dto.FreeLikeDTO;
import io.pet.mint.freeBoard.service.FreeBoardService;
import io.pet.mint.freeBoard.service.FreeCommService;
import io.pet.mint.freeBoard.service.FreeLikeService;

@Controller
@RequestMapping(value="/freeBoard/*")
public class FreeController {
	
	@Autowired
	FreeBoardService service;
	
	@Autowired
	FreeCommService commService;
	
	@Autowired
	FreeLikeService likeService;
	
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
		
		service.viewCount(Integer.parseInt(boardSeq));
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
		
	//	System.out.println("----------" + par.toString());
		
		int sn = par.getNowPage();	// 0 1 2
		int start = sn * par.getCountPerPage() + 1;	// 1  11 21 
		int end = (sn + 1) * par.getCountPerPage();	// 10 20 30
		
		par.setStart(start);
		par.setEnd(end);
		
		List<FreeBoardDTO> list = service.freeBoardSearch(par);
		System.out.println(list);
		return list;
	}
	
	@ResponseBody
	@PostMapping(value="freeBoardPaging")
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
	
	@PostMapping(value="freeBoardUpdate")
	public String freeBoardUpdate(FreeBoardDTO dto) {
		
		service.freeBoardUpdate(dto);
		System.out.println("fdasdfa= " + dto.getBoardSeq());
		
		return "view:freeBoard/freeBoard";
	}
	
	@ResponseBody
	@PostMapping(value="checkDel")
	public String checkDel(
			@RequestParam(value="boardSeq")int boardSeq) {
		
	//	System.out.println("=============================================제발요=======================================================");
		
		int check = service.checkDel(boardSeq);
		
		return check>0?"ok":"no";
	}
	
	
	
	
	
	
	
	//---------------댓글--------------//
	
	@ResponseBody
	@PostMapping(value="addFreeComm")
	public String addFreeComm(FreeCommDTO comm) {
		System.out.println(comm.toString());
		int n = commService.addFreeComm(comm);
		System.out.println("등록 = " + n);
		return n>0?"ok":"no";
	}
	
	@ResponseBody
	@PostMapping(value="getFreeCommList")
	public List<FreeCommDTO> getFreeCommList(Model model, FreeCommParam param){
	
		int sn = param.getPageNumber();	// 0 1 2
		int start = sn * param.getCountPerPage() + 1;	// 1  11 21 
		int end = (sn + 1) * param.getCountPerPage();	// 10 20 30
		
		param.setStart(start);
		param.setEnd(end);
		
		List<FreeCommDTO> list = commService.getFreeCommList(param);
		model.addAttribute(list);
		
		System.out.println(list);
		
		return list;
	}
	
	@ResponseBody
	@PostMapping(value="getCommCount")
	public int getCommCount(FreeCommParam param) {
	//	System.out.println("pahuhsugheuw");
		int count = commService.getCommCount(param.getCommRef());
	//	System.out.println("count = "+ count);
		return count;
	}
	
	@ResponseBody
	@PostMapping(value="freeCommDelete")
	public String freeCommDelete(
			@RequestParam(value="commSeq") int commSeq) {
		
		int check = commService.freeCommDelete(commSeq);
		
		return check>0?"ok":"no";
	}
	
	@ResponseBody
	@PostMapping(value="freeCommUpdate")
	public String freeCommUpdate(FreeCommDTO dto) {
		
		int check = commService.freeCommUpdate(dto);
	//	System.out.println("--------댓글--------- : " + check);
		return check>0?"ok":"no";
	}
	
	
	
	
	
	
	//-------------------- 추천 버튼 ------------------------//
	
	@ResponseBody
	@PostMapping(value="freeLikeButton")
	public String freeLikeButton(FreeLikeDTO dto) {
		
		int n = likeService.freeLikeButton(dto);
	//	System.out.println("------------------------------------------------");
		service.freeLikeCount(dto.getBoardSeq());
		return n > 0?"ok":"no";
	}

	@ResponseBody
	@PostMapping(value="getLikeCount")
	public int getLikeCount(int boardSeq) {
		System.out.println("----------------------------------------------");
		int count = likeService.getLikeCount(boardSeq);
		
		return count;
	}

}
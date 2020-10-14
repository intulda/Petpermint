package io.pet.mint.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import io.pet.mint.lostPet.dto.LCommDto;
import io.pet.mint.lostPet.dto.LostImagesDto;
import io.pet.mint.lostPet.dto.LostPetDto;
import io.pet.mint.lostPet.dto.LostPetParam;
import io.pet.mint.lostPet.service.LostImagesService;
import io.pet.mint.lostPet.service.LostPetService;
import io.pet.mint.placeBoard.dto.ImagesDto;
import io.pet.mint.util.CommonUtil;

@Controller
@RequestMapping(value="/lostPet/*")
public class LostPetController {

	@Autowired
	LostPetService service;
	
	@Autowired
	LostImagesService imageService;
	
	@GetMapping(value = "lostPet")
	public String lostPet() {
		
		return "view:lostPet/lostPet";
	}
	
	@ResponseBody
	@PostMapping(value="getLostPet") 
	public List<LostPetDto> getLostPetList(Model model, LostPetParam param) {

		// paging 처리
		int sn = param.getPageNumber();
		int start = sn * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();	
		param.setStart(start);
		param.setEnd(end);
				
		List<LostPetDto> list = service.getLostPetList(param);
		
		for(LostPetDto dto : list) {
			
			LostImagesDto imagesDto = imageService.getImages(dto.getLostSeq());
			
			if(imagesDto != null) {
				byte[] byteImage = imagesDto.getImagesPath();
				dto.setImagePath(CommonUtil.imageToBase64(byteImage));
			}	
		}
			
		System.out.println(list);
		//model.addAttribute("list", list);
	
		return list;
	}
	
	@ResponseBody
	@PostMapping(value = "getCount")
	public int getCount(LostPetParam param) {
		int count = service.getCount(param);
		System.out.println("게시물 갯수: " + count);
		return count;
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
		
		return "view:lostPet/lostPetDetail";
	}
	
	@GetMapping(value="lostPetWrite")
	public String lostPetWrite() {
		
		System.out.println("lostPetWritedddddddddddddddddddddddddddddddddddddddddddddddddffa");
		return "view:lostPet/lostPetWrite";
	}
	
	@PostMapping(value = "lostPetWriteAf")
	public String lostPetWriteAf(
			LostPetDto lostPetDto
	,@RequestParam(value = "thumbnail", required = false)MultipartFile thumbnail
	) {
		
		System.out.println("lostPetDto1" + lostPetDto.toString());
		
		try {
			
			// 게시판 내용 저장
			service.getLostPetWriteAf(lostPetDto);
												
			LostImagesDto imageDto = new LostImagesDto();
			// 썸네일 이미지 이름	, 파일 저장	
			
			System.out.println("ㅗ"+imageDto.toString());
			imageDto.setImagesPath(thumbnail.getBytes());
			imageService.saveImages(imageDto);
							
			
			
			return "view:lostPet/lostPet";
			
		} catch (IOException e1) {
			
			e1.printStackTrace();
			return "view:lostPet/lostPet";
		}	
	}
	
	@ResponseBody
	@PostMapping(value = "lostPetLCommWriteAf")
	public String lostPetLCommWriteAf(LCommDto lcommDto, Model model) throws Exception {
		System.out.println("lostPetLCommWriteAf 도착" + lcommDto.getLcommSeq());
		int n = service.getLostPetLCommWrite(lcommDto);
		
		return n>0?"ok":"no";
	}
	
		
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

	@PostMapping(value = "lcommUpdateAf")
	public String lcommUpdateAf(LCommDto dto, Model model, RedirectAttributes redirect) throws Exception {
		
		System.out.println(dto.toString());
		int n = service.getLCommUpdate(dto);
		redirect.addAttribute("seq", dto.getLostpetSeq());
		return "redirect:/lostPet/lostPetDetail";
	}
	

}

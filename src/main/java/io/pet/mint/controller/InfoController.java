package io.pet.mint.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import io.pet.mint.info.dto.InfoDto;
import io.pet.mint.info.dto.InfoImagesDto;
import io.pet.mint.info.dto.InfoParam;
import io.pet.mint.info.service.InfoService;
import io.pet.mint.util.CommonUtil;

@Controller
@RequestMapping(value ="/info/*")
public class InfoController {
	
	@Autowired
	InfoService service;

	
	// Get Mapping
	
	// 강아지 페이지로 이동
	@GetMapping(value="dogPage")
	public String dogPage() {
		System.out.println("InfoController 접근중 : dogpage(강아지 메인페이지 입니다.)");
		return "view:info/dogPage";
	}
	
	  	//	dog List page 이동
	  @GetMapping(value = "dogListPageView") 
	  public String dogListPageView(String Type,Model model) {
	  model.addAttribute("boardType", Type);
	 
	  return "view:info/dogListPage"; 
	  }
		
	//글쓰기 페이지 이동(강아지/고양이 통합)
	@GetMapping(value="infoWrite")
		public String infoWrite() {
		return "view:info/infoWrite";
		}	
		
	//dogList에서 Detail페이지 이동
	@GetMapping(value = "dogDetail")
		public String dogDetail(int seq, Model model) {	
			
			InfoDto infoDto = service.infoDetail(seq);
					
			InfoImagesDto imageDto = service.imgDetail(seq); // 이미지를 가져오는것
			
			if(imageDto!= null) {
				byte[] byteImage = imageDto.getImagesPath();
				infoDto.setFilePath(CommonUtil.imageToBase64(byteImage));
			}
			
			model.addAttribute("infoDto", infoDto);
			
			return "view:info/dogDetail";
	}
		
	//Deail 페이지에서 UpDate 페이지 이동!
	@GetMapping(value="infoUpDate")
		public String infoUpDate(int seq, Model model) {
			
			InfoDto infoDto = service.infoDetail(seq);
			
			InfoImagesDto imageDto = service.imgDetail(seq); // 이미지를 가져오는것
			
			if(imageDto!= null) {
				byte[] byteImage = imageDto.getImagesPath();
				infoDto.setFilePath(CommonUtil.imageToBase64(byteImage));
			}
			
			model.addAttribute("infoDto", infoDto);
			return "view:info/dogUpDate";
		}

	 // 글 삭제
	 @GetMapping(value="infoDelete") 
	 public String infoDelete(int seq, Model model) {
		 
		 service.infoDelete(seq);
		 
		 return "redirect:/info/dogPage"; 
	 }
		
	// Post Mapping
	
	// 강아지/고양이 게시글 불러오기 !
	@ResponseBody
	@PostMapping(value="dogListPage")
		public List<InfoDto> getInfoList(Model model, InfoParam par) {

			// paging
			int sn = par.getPageNumber();	// 0 1 2
			int start = sn * par.getRecordCountPerPage() + 1;	// 1  11 21 
			int end = (sn + 1) * par.getRecordCountPerPage();	// 10 20 30
			par.setStart(start);
			par.setEnd(end);
			List<InfoDto> getInfoList = service.dogListPage(par);
			
			//이미지
			getInfoList = getInfoList.stream()
						.map(e -> {
							if(e.getImagesPath() != null) {
								e.setFilePath(CommonUtil.imageToBase64(e.getImagesPath()));
							}
							return e;
						}).collect(Collectors.toList());
//			model.addAttribute("getInfoList", getInfoList);
//			for(InfoDto infoDto : getInfoList) {
//				InfoImagesDto imageDto = service.imgDetail(infoDto.getBoardSeq());
//				if(imageDto!= null) {
//					byte[] byteImage = imageDto.getImagesPath();
//					infoDto.setFilePath(CommonUtil.imageToBase64(byteImage));
//					}
//				}
				
				return getInfoList;
			}
	
	//글쓰기 및 이미지 
	@PostMapping (value = "dogWriteAf") 
		public String dogWriteAf (InfoDto dto , 
			@ RequestParam (value = "thumbnail", required = false) 
			 MultipartFile thumbnail , HttpServletRequest req) { 

				try { 
					// byte [ ] 이미지 = dto.getImagesPath (); 			
			
					//글쓰기 완료   
					int dbCheck = service.infoWrite(dto); 
					System.out.println ( "글 추가 완료 :"+ dbCheck); 

					//이미지
					InfoImagesDto imageDto = new InfoImagesDto(); 
					
					//이미지 바이트를 dto에 저장
					imageDto.setImagesPath (thumbnail.getBytes ()); 
			    
					dbCheck = service.imgSave(imageDto); 
					System.out.println ( "이미지 추가 완료 : "+ dbCheck); 
					
				return "redirect:/info/dogPage"; 	
				
				} catch (IOException e1) { 
					e1.printStackTrace (); 		
					
					return "redirect:/info/dogPage"; 
				} 
					}
			
	// 글 수정
	@PostMapping(value="dogUpDateAf") 
	 public String dogUpDateAf(InfoDto dto,Model model,
			 @RequestParam(value = "thumbnail", required = false) 
		 	MultipartFile thumbnail ) {
			
			try { 
				//글쓰기 수정완료   
				service.infoUpDateAf(dto);
				
				if(!thumbnail.isEmpty()) {
					InfoImagesDto imgDto = new InfoImagesDto();
				
				//이미지 수정완료
				InfoImagesDto imageDto = new InfoImagesDto(); 
				
				//이미지 바이트를 dto에 저장
				imageDto.setImagesPath (thumbnail.getBytes ()); 
				imageDto.setBoardSeq(dto.getBoardSeq());
				service.imgUpDate(imageDto); 
				
				}
				
			return "redirect:/info/dogPage"; 	
			
			} catch (IOException e1) { 
				e1.printStackTrace (); 		
				
				return "redirect:/info/dogPage"; 
			} 
				}
		 
		 // getcount
		 @ResponseBody
		 @PostMapping(value="getCount") 
		 public int getCount(InfoParam param, Model model) {
			 
			 int count = service.getInfoListCount(param);
			 
			 return count; 
		   }				
		} 
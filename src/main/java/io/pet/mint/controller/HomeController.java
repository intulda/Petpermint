package io.pet.mint.controller;

import io.pet.mint.search.dto.SearchDTO;
import io.pet.mint.search.dto.SearchLostPetDTO;
import io.pet.mint.search.dto.SearchParamDTO;
import io.pet.mint.search.service.SearchService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class HomeController {

    private SearchService searchService;

    public HomeController(SearchService searchService) {
        this.searchService = searchService;
    }

    /**
     * 메인페이지 이동 및 메인 데이터
     * @param model
     * @return
     */
    @GetMapping("/")
    public String index(Model model) {
        SearchParamDTO searchParamDTO = new SearchParamDTO();
        List<SearchDTO> boardList =  searchService.getBoardList(searchParamDTO);
        List<SearchLostPetDTO> searchList =  searchService.getLostPetList(searchParamDTO);
        model.addAttribute("catList", searchService.getBoardTypeFilter("고양이", boardList))
                .addAttribute("dogList", searchService.getBoardTypeFilter("강아지", boardList))
                .addAttribute("lostPetList", searchService.getBoardTypeFilter("LOST_PET", searchList));
        return "view:index";
    }

    @PostMapping("/search")
    public String search(@RequestBody SearchParamDTO searchParamDTO, Model model) {
        List<SearchDTO> boardList =  searchService.getBoardList(searchParamDTO);
        model.addAttribute("catList", searchService.getBoardTypeFilter("고양이", boardList))
                .addAttribute("dogList", searchService.getBoardTypeFilter("강아지", boardList))
                .addAttribute("freeBoard", searchService.getBoardTypeFilter("자유게시판", boardList))
                .addAttribute("keyword", searchParamDTO.getKeyword())
                .addAttribute("totalCount", 0);
        return "search/search";
    }
}

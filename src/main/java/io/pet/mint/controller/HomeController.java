package io.pet.mint.controller;

import io.pet.mint.search.dto.SearchDTO;
import io.pet.mint.search.dto.SearchLostPetDTO;
import io.pet.mint.search.dto.SearchParamDTO;
import io.pet.mint.search.service.SearchService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    private SearchService searchService;

    public HomeController(SearchService searchService) {
        this.searchService = searchService;
    }

    @GetMapping("/")
    public String index(Model model) {
        SearchParamDTO searchParamDTO = new SearchParamDTO();
        List<SearchDTO> boardList =  searchService.getBoardList(searchParamDTO);
        List<SearchLostPetDTO> searchList =  searchService.getLostPetList(searchParamDTO);
        model.addAttribute("catList", searchService.getBoardTypeFilter("CAT", boardList))
                .addAttribute("dogList", searchService.getBoardTypeFilter("DOG", boardList))
                .addAttribute("lostPetList", searchService.getBoardTypeFilter("LOST_PET", searchList));
        return "view:index";
    }
}
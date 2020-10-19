package io.pet.mint.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/market/*")
public class MarketController {

	@GetMapping(value="market")
	public String marketList() {
		return "view:market/market";
	}
	
	@GetMapping(value="marketWrite")
	public String marketeWrite() {
		return "view:market/marketWrite";
	}

	
	
}

package com.smhrd.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class CatCardController {
	

	@RequestMapping("/catcard.do")
	public String catcard() {
		return "catcard";
	}
	
	@GetMapping("/catcardSearch.do")
	public void catcardSearch() {
		
	}
	
	

}

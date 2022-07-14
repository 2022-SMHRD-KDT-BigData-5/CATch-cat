package com.smhrd.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BoardController {
	
	//각 게시판으로 이동하는 메서드
	@RequestMapping("/adopt.do")
	public String adoptboard() {
		
		return "adopt";
	}
	
	@RequestMapping("/comm.do")
	public String commboard() {
		return "comm";
	}
	
	@RequestMapping("/spon.do")
	public String sponboard() { 
		return "spon";
	}
	
	
	
	

}

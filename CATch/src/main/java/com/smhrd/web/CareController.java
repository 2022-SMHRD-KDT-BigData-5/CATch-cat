package com.smhrd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.mapper.BoardMapper;

@Controller	
public class CareController {

	@Autowired
	BoardMapper mapper;
	
	@RequestMapping("/careList.do")
	public void careList( Model model) {}
}

package com.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.domain.CareBoard;
import com.smhrd.mapper.BoardMapper;

@Controller	
public class CareController {

	@Autowired
	BoardMapper mapper;
	
	@RequestMapping("/careList.do")
	public String carelist(@ModelAttribute("care") CareBoard care,  ModelMap model) throws Exception {
  
	    List<CareBoard> list = mapper.careList();
	    model.addAttribute("list", list);
	        
	    return "careList";
	
	}
}
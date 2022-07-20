package com.smhrd.web;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;




import com.smhrd.domain.CareBoard;

import com.smhrd.mapper.CareMapper;

@Controller	
public class CareController {

	@Autowired
	CareMapper mapper;
	
	
	
	@RequestMapping("/caremap.do")
	public String carelist(Model model,HttpServletRequest request, CareBoard careBoard)  {
		
		System.out.println(careBoard.getCare_name());
		
		return "map";
		
	}

	
	
}

     
 










	

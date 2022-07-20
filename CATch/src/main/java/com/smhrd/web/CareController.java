package com.smhrd.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;




import com.smhrd.domain.CareBoard;

import com.smhrd.mapper.CareMapper;

@Controller	
public class CareController {

	@Autowired
	CareMapper mapper;
	
	
	
	@RequestMapping("/caremap.do")
	public String carelist(Model model,HttpServletRequest request, CareBoard careBoard)  {
		
		
		return "map";
		
	}
	
	@RequestMapping("/carezone.do")
	public String carezone() {
		return "carezone";
	}
	
	@RequestMapping("/insertAddress.do")
	public String insertAddress(CareBoard careBoard, Model model) {
		int cnt = 0;
		cnt = mapper.insertAddress(careBoard);
		if(cnt>0) {
			System.out.println("db에 급식소 등록 성공");
		}
		return "redirect:/carezone.do";
	}

	
	
}

     
 










	

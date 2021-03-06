package com.smhrd.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.domain.CareBoard;
import com.smhrd.domain.CatCard;
import com.smhrd.mapper.CareMapper;

@Controller	
public class CareController {

	@Autowired
	CareMapper mapper;
	
	
	
	@RequestMapping("/carezone.do")
	public String carezone(Model model) {
		List<CareBoard> careList = mapper.selectCareZone();
		model.addAttribute("careList", careList);
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
	
	@RequestMapping("/selectCatCarezone.do")
	public String selectCatCarezone(Model model, int cat_carezone) {
		List<CatCard> catcardList = mapper.selectCareCatCard(cat_carezone);
		model.addAttribute("catcardList", catcardList);
		
		return "redirect:/carezone.do";
	}
	
	
	

	
	
}

     
 










	

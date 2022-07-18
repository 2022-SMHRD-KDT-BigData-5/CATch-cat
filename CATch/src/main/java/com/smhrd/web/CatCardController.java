package com.smhrd.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.smhrd.domain.CatCard;
import com.smhrd.mapper.CatCardMapper;

@Controller
public class CatCardController {
	
	@Autowired
	CatCardMapper mapper;

	@RequestMapping("/catcard.do")
	public String catcard() {
		return "catcard";
	}
	
	@RequestMapping("/catcardSearch.do")
	public String catcardSearch() {
		return "catcardSearch";
	}
	
	
	//캣카드 번호로 캣카드 조회
	@RequestMapping("/seqSearch.do")
	public String seqSearch(Model model, int cat_seq) {
		CatCard catcard = mapper.seqSearch(cat_seq);
		System.out.println(catcard.getCat_name());
		model.addAttribute("catcard", catcard);
		return "redirect:/catcard.do";
	}
	
	//비문 사진으로 캣카드 조회
	@RequestMapping("/imgSearch.do")
	public void imgSearch() {
		
	}
	
	
	

}

package com.smhrd.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.smhrd.domain.CatCard;
import com.smhrd.domain.Medical;
import com.smhrd.domain.Vaccination;
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
	public String seqSearch(HttpServletRequest request, int cat_seq) {
		CatCard catcard = mapper.seqCatSearch(cat_seq);
		List<Medical> medicalList = mapper.seqMediSearch(cat_seq);
		List<Vaccination> jh = mapper.jhSearch(cat_seq);
		List<Vaccination> gg = mapper.ggSearch(cat_seq);
		List<Vaccination> jb = mapper.jbSearch(cat_seq);
		List<Vaccination> hc = mapper.hcSearch(cat_seq);
		List<Vaccination> ss = mapper.ssSearch(cat_seq);
		
		HttpSession session = request.getSession();
		session.setAttribute("catcardInfo", catcard);
		session.setAttribute("medicalList", medicalList);
		session.setAttribute("jh", jh);
		session.setAttribute("gg", gg);
		session.setAttribute("jb", jb);
		session.setAttribute("hc", hc);
		session.setAttribute("ss", ss);
		
		return "redirect:/catcard.do";
	}
	
	//비문 사진으로 캣카드 조회
	@RequestMapping("/imgSearch.do")
	public void imgSearch() {
		
	}
	
	
	// --------------------------------------------------------------
	
	
	
	

}

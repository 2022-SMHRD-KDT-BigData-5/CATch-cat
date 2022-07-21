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
	//진료접종내역 수정창으로 이동하는 메서드
	@RequestMapping("/medicalUpdate.do")
	public String medicalUpdate() {
		return "medicalUpdate";
	}
	
	//(병원관계자용) 진료+접종내역 update
	@RequestMapping("/mediUpdate.do")
	public String mediUpdate(String medi_id, String medi_name, int cat_seq, String medi_content) {
		Medical medi = new Medical(medi_id, medi_name, medi_content, cat_seq);
		mapper.mediUpdate(medi);
		return "redirect:/catcard.do"; //바로 반영 안되는거 고쳐주세요
	}
	
	@RequestMapping("/vaccUpdate.do")
	public String vaccUpdate(String medi_id, String medi_name, int cat_seq, String[] vacc_type) {
		int cnt = 0;
		for(int i=0; i<vacc_type.length; i++) {
		Vaccination vacc = new Vaccination(vacc_type[i], medi_id, medi_name, cat_seq);
		cnt = mapper.vaccUpdate(vacc);
		if(cnt>0) {
			System.out.println(vacc_type[i]+"접종완료");
		}}
		return "redirect:/catcard.do"; //바로 반영 안되는거 고쳐주세요
	}
	
	//캣카드 등록
	@RequestMapping("/catcardInsert.do")
	public String catcardform(CatCard cardform ,Model model) {
		int cnt = 0;
		cnt = mapper.insertcatcard(cardform);
		if(cnt>0) {
			System.out.println("캣카드 등록 성공");
		}
		return "redirect:/catcard.do";
	}
	
	//캣카드 등록으로 이동
	@RequestMapping("/catcardForm.do")
	public String catcardInsert() {
		
		return "catcardForm";
	}

}

package com.smhrd.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.domain.Member;
import com.smhrd.domain.Petcare;
import com.smhrd.domain.PetcareAdmin;
import com.smhrd.domain.PetcareReview;
import com.smhrd.mapper.PetcareMapper;

@Controller
public class PetcareController {
	
	@Autowired
	PetcareMapper mapper;
	
	
	//펫케어로 이동
	@RequestMapping("/petcare.do")
	public String getPetcare(Model model) {
		List<Petcare> petCareList = mapper.selectPetcareList();
		model.addAttribute("petCareList", petCareList);
		return "petcare";
	}
	
	//펫케어 상세정보로 이동+리뷰출력
	@RequestMapping("/petcareInfo.do")
	public String getPetcareReview(HttpSession session, int petcare_seq) {
		Petcare petcare = mapper.selectPetcare(petcare_seq);
		session.setAttribute("petcare", petcare);
		
		List<PetcareReview> petCareReviewList = mapper.selectPetcareReviewList(petcare_seq);
		session.setAttribute("petCareReviewList", petCareReviewList);
		
		return "petcareInfo";
	}
	
	//펫케어 후기 등록
	@RequestMapping("/insertReview.do")
	public String insertReview(PetcareReview petcareReview) {
		int cnt=0;
		cnt = mapper.insertReview(petcareReview);
		if(cnt>0) {
			System.out.println("리뷰 등록 성공");
		}else {
			System.out.println("리뷰등록 실패");
		}
		int petcare_seq = petcareReview.getReview_petcare();
		
		return "redirect:/petcareInfo.do?petcare_seq="+petcare_seq;
	}
	
	//펫케어Admin 고객방문기록 조회
	@RequestMapping("/catcardAdmin.do")
	public String selectPetcareAdmin(HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		String admin_id = member.getMem_id();
		PetcareAdmin petcareAdmin = mapper.selectPetcareAdmin(admin_id);
		session.setAttribute("petcareAdmin", petcareAdmin);
		return "catcardAdmin";
	}
	
	//펫케어Admin 고객방문기록 등록
	@RequestMapping("/insertPetcareAdmin.do")
	public String insertPetcareAdmin(PetcareAdmin petcareAdmin) {
		int cnt = 0;
		cnt = mapper.insertPetcareAdmin(petcareAdmin);
		if(cnt>0) {
			System.out.println("방문기록 등록 성공");
		}else {
			System.out.println("방문기록 등록 실패");
		}
		
		return "";
	}
	


}

package com.smhrd.web;


import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.domain.CatCard;
import com.smhrd.domain.Medical;
import com.smhrd.domain.Member;
import com.smhrd.domain.PetcareAdmin;
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
		
		List<PetcareAdmin> catcardPetcare = mapper.selectAdmin(cat_seq);
		session.setAttribute("catcardPetcare", catcardPetcare);
		
		return "redirect:/catcard.do";

	}
	
	//비문 사진으로 캣카드 조회
	@RequestMapping("/imgSearch.do")
	public String imgSearch(HttpServletRequest request) {
		
		// 여기다가 추가해서 바꾸기
		int cat_seq = 20228198;
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
		
		List<PetcareAdmin> catcardPetcare = mapper.selectAdmin(cat_seq);
		session.setAttribute("catcardPetcare", catcardPetcare);
		
		return "redirect:/catcard.do";

	}
	@RequestMapping("/searchCom.do")
	public String searchCom() {
		
		return "searchcom";
	}
	
	
	// --------------------------------------------------------------
	//진료접종내역 수정창으로 이동하는 메서드
	@RequestMapping("/medicalUpdate.do")
	public String medicalUpdate() {
		return "medicalUpdate";
	}
	
	//(병원관계자용) 진료+접종내역 update
	@RequestMapping("/mediUpdate.do")
	public String mediUpdate(String medi_id, String medi_name, int cat_seq, String medi_content, Model model) {
		Medical medi = new Medical(medi_id, medi_name, medi_content, cat_seq);
		mapper.mediUpdate(medi);
		model.addAttribute("cat_seq", cat_seq);
		return "redirect:/seqSearch.do";
	}
	
	@RequestMapping("/vaccUpdate.do")
	public String vaccUpdate(String medi_id, String medi_name, int cat_seq, String[] vacc_type, Model model) {
		int cnt = 0;
		for(int i=0; i<vacc_type.length; i++) {
		Vaccination vacc = new Vaccination(vacc_type[i], medi_id, medi_name, cat_seq);
		cnt = mapper.vaccUpdate(vacc);
		if(cnt>0) {
			System.out.println(vacc_type[i]+"접종완료");
		}}
		model.addAttribute("cat_seq", cat_seq);
		return "redirect:/seqSearch.do";
	}
	
	
	// 캣카드 등록
	@RequestMapping("/catcardInsert.do")
	public String catcardform(CatCard cardform, HttpSession session, @RequestParam("file") MultipartFile file)
			throws IOException {

		String fileRealName = file.getOriginalFilename();
		long size = file.getSize(); // 파일사이즈

		// 서버에 저장할 파일이름 fileextension으로 .jsp 이런식의 확장명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		String path = session.getServletContext().getRealPath("resources/upload");

		// 파일업로드시 그 폴더에 동일한 명칭이 있을수도 있기때문에 랜덤한 명칭을 줌
		UUID uuid = UUID.randomUUID();
		String[] uuids = uuid.toString().split("-");
		String uniqueName = uuids[0];

		File saveFile = new File(path + "\\" + uniqueName + fileExtension);
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		}

		String url = path + "\\" + uniqueName + fileExtension;

		cardform.setCat_url(url);
		cardform.setCat_sname(uniqueName + fileExtension);
		mapper.insertcatcard(cardform);

		return "catLoding";
	}

	//캣카드 코사진 등록 페이지
	@RequestMapping("/imgNoseForm.do")
	public String catcardNose() {
		
		return "catcardNoseForm";
	}


	//캣카드  등록 페이지

	//캣카드  등록 페이지 + 고양이주민번호 랜덤하게 주기(DB구조는 안고침)(상의)

		@RequestMapping("/catcardregistration.do")
		public String catcardregistration(Model model,HttpServletRequest request, String label) {
			
			String cat_label = request.getParameter("label");
			
			
			LocalDate now = LocalDate.now();
			
			int year = now.getYear();
			int monthValue = now.getMonthValue();
			int dayOfMonth = now.getDayOfMonth();
			//0~999
			int rand = (int)(Math.random()*1000);
			
			String num = Integer.toString(year) + Integer.toString(monthValue)+
					Integer.toString(dayOfMonth)+ Integer.toString(rand);
			
			model.addAttribute("catnum", num);
			model.addAttribute("cat_label", cat_label);
			
			return "catcardForm";
	}
		
	
	//캣카드 등록 로딩 페이지
	@RequestMapping("/loding.do")
	public String catcardloding() {
		
		return "catLoding";
	}
	
	//캣카드 등록 완료
	@RequestMapping("/completion.do")
	public String catcardcompletion() {
		
		return "success";
	}

	// 로딩중 페이지로 이동
	@RequestMapping("/loading1.do")
	public String catcardload() {
		return "loading1";
	}
	
	
	
	//캣카드 더보기 클릭시 멤버 확인
	@PostMapping("/catcardMemCheck.do")
	@ResponseBody
	public int catcardMemCheck(@RequestParam("cat_mem_id") String cat_mem_id, HttpSession session ) {
		System.out.println("컨트롤러 도착/캣카드보호자는"+cat_mem_id);
		int check=0;
		Member member = (Member)session.getAttribute("member");

		if(member.getMem_id().equals(cat_mem_id)) {
			check=1;
		}
		System.out.println("비교 성공");
		return check;
	}
				


}

	
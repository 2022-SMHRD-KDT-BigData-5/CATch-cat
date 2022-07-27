package com.smhrd.web;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.domain.CatCard;
import com.smhrd.domain.Medical;
import com.smhrd.domain.Member;
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
	   public String catcardform(CatCard cardform, HttpSession session, @RequestParam("file") MultipartFile file) 
	         throws IOException{
	      
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
	      
	      return "redirect:/catcard.do";
	      }
	
	
	//캣카드 코사진 등록 페이지
	@RequestMapping("/imgNoseForm.do")
	public String catcardNose() {
		
		return "catcardNoseForm";
	}

	//캣카드  등록 페이지
		@RequestMapping("/catcardregistration.do")
		public String catcardregistration() {
			
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
		
		return "catnext";
	}

	// 로딩중 페이지로 이동
	@RequestMapping("/loading1.do")
	public String catcardload() {
		return "loading1";
	}
				

	
}

	
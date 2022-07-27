package com.smhrd.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.smhrd.domain.AdoptBoard;
import com.smhrd.domain.AdoptComment;
import com.smhrd.domain.CommBoard;
import com.smhrd.domain.CommComment;
import com.smhrd.domain.Member;
import com.smhrd.domain.Petcare;
import com.smhrd.domain.PetcareReview;
import com.smhrd.domain.SponBoard;
import com.smhrd.domain.SponComment;
import com.smhrd.mapper.BoardMapper;

@Controller
public class BoardController {

	// ---------------------- mybatis-spring으로 자동연결
	@Autowired
	BoardMapper mapper;

	// --------------------- 각 게시판으로 이동하는 메서드(게시판 전체 내용 가져와서 객체바인딩)
	@RequestMapping("/adopt.do")
	public String adoptboard(Model model) {
		List<AdoptBoard> adoptList = mapper.adoptBoardList();
		model.addAttribute("adoptList", adoptList);
		return "board/adopt";
	}

	@RequestMapping("/comm.do")
	public String commboard(Model model) {
		List<CommBoard> commList = mapper.commBoardList();
		model.addAttribute("commList", commList);
		return "board/comm";
	}

	@RequestMapping("/spon.do")
	public String sponboard(Model model) {
		List<SponBoard> sponList = mapper.sponBoardList();
		model.addAttribute("sponList", sponList);
		return "board/spon";
	}

	// ---------------------- 게시글 상세페이지로 이동하는 메서드(board_seq 받아서 댓글 + 게시글 전체정보 출력)

	@RequestMapping("adtinfo.do")
	public String adoptBoardInfo(Model model, int adt_seq, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "redirect:/login.do";
		} else {
			mapper.adoptCntUpdate(adt_seq);
			model.addAttribute("adt_seq", adt_seq);
			AdoptBoard adoptInfo = mapper.adoptBoardInfo(adt_seq);
			model.addAttribute("adoptInfo", adoptInfo);
			List<AdoptComment> adoptCommentList = (List<AdoptComment>) mapper.adoptCommentList(adt_seq);
			model.addAttribute("adoptCommentList", adoptCommentList);
			return "board/adoptInfo";
		}
	}

	@RequestMapping("comminfo.do")
	public String commBoardInfo(Model model, int article_seq, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "redirect:/login.do";
		} else {
			mapper.commCntUpdate(article_seq);
			model.addAttribute("article_seq", article_seq);
			CommBoard commInfo = mapper.commBoardInfo(article_seq);
			model.addAttribute("commInfo", commInfo);
			List<CommComment> commCommentList = (List<CommComment>) mapper.commCommentList(article_seq);
			model.addAttribute("commCommentList", commCommentList);
			return "board/commInfo";
		}
	}

	@RequestMapping("sponinfo.do")
	public String sponBoardInfo(Model model, int spon_seq, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "redirect:/login.do";
		} else {
			mapper.sponCntUpdate(spon_seq);
			model.addAttribute("spon_seq", spon_seq);
			SponBoard sponInfo = mapper.sponBoardInfo(spon_seq);
			model.addAttribute("sponInfo", sponInfo);
			List<SponComment> sponCommentList = (List<SponComment>) mapper.sponCommentList(spon_seq);
			model.addAttribute("sponCommentList", sponCommentList);
			return "board/sponInfo";
		}
	}

	// ---------------- 게시글 작성페이지로 이동하는 메서드

	@GetMapping("/adoptBoardInsert.do")
	public String adoptBoardForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "redirect:/login.do";
		} else {
			return "board/adoptBoardForm";
		}
	}

	@GetMapping("/commBoardInsert.do")
	public String commBoardForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "redirect:/login.do";
		} else {
			return "board/commBoardForm";
		}
	}

	@GetMapping("/sponBoardInsert.do")
	public String sponBoardForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "redirect:/login.do";
		} else {
			return "board/sponBoardForm";
		}
	}

	// ----------- 게시글 등록하는 메서드0
	@PostMapping("/adoptBoardInsert.do")
	public String adoptInsert(AdoptBoard vo, HttpSession session, @RequestParam("file") MultipartFile file)
			throws IOException {
		
		if (!file.isEmpty()) {
			// 원본파일명
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
				// 실제 파일에 저장
				file.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			}

			String url = path + "\\" + uniqueName + fileExtension;

			vo.setAdt_url(url);
			vo.setAdt_sname(uniqueName + fileExtension);
			mapper.adoptFileInsert(vo);

		}else {
			mapper.adoptBoardInsert(vo);
		}
		
		
		
		return "redirect:/adopt.do";
	}

	@PostMapping("/commBoardInsert.do")
	public String commInsert(CommBoard vo, HttpSession session, @RequestParam("file") MultipartFile file)
			throws IOException{
		
		if (!file.isEmpty()) {
			// 원본파일명
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
				// 실제 파일에 저장
				file.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			}

			String url = path + "\\" + uniqueName + fileExtension;

			vo.setArticle_url(url);
			vo.setArticle_sname(uniqueName + fileExtension);
			mapper.commFileInsert(vo);

		} else {
			mapper.commBoardInsert(vo);
		}

		return "redirect:/comm.do";
	}

	@PostMapping("/sponBoardInsert.do")
	public String boardForm(SponBoard vo, HttpSession session, @RequestParam("file") MultipartFile file)
			throws IOException{
		if (!file.isEmpty()) {
			// 원본파일명
			String fileRealName = file.getOriginalFilename();
			long size = file.getSize(); // 파일사이즈

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

			vo.setSpon_url(url);
			vo.setSpon_sname(uniqueName + fileExtension);

			mapper.sponFileInsert(vo);

		} else {
			mapper.sponBoardInsert(vo);
		}

		return "redirect:/spon.do";
	}

	// ----------- 댓글 등록하는 메서드
	@RequestMapping("/adoptCommentInsert.do")
	public String adoptComment(AdoptComment vo) {
		mapper.adoptCommentInsert(vo);
		return "redirect:/adtinfo.do?adt_seq=" + vo.getAdt_seq();
	}

	@RequestMapping("/commCommentInsert.do")
	public String commComment(CommComment vo) {
		mapper.commCommentInsert(vo);
		return "redirect:/comminfo.do?article_seq=" + vo.getArticle_seq();
	}

	@RequestMapping("/sponCommentInsert.do")
	public String sponComment(SponComment vo) {
		mapper.sponCommentInsert(vo);
		return "redirect:/sponinfo.do?spon_seq=" + vo.getSpon_seq();
	}

	// ---------- 게시글 삭제 메서드
	@RequestMapping("/adoptBoardDelete.do")
	public String adoptDelete(int adt_seq) {
		mapper.adoptBoardCommentDelete(adt_seq);
		mapper.adoptBoardDelete(adt_seq);
		return "redirect:/adopt.do";
	}

	@RequestMapping("/sponBoardDelete.do")
	public String sponDelete(int spon_seq) {
		mapper.sponBoardCommentDelete(spon_seq);
		mapper.sponBoardDelete(spon_seq);
		return "redirect:/spon.do";
	}

	@RequestMapping("/commBoardDelete.do")
	public String commDelete(int article_seq) {
		mapper.commBoardCommentDelete(article_seq);
		mapper.commBoardDelete(article_seq);
		return "redirect:/comm.do";
	}

	// --------- 댓글 삭제 메서드
	@RequestMapping("/adoptBoardCmtDelete.do")
	public String adoptCmtDelete(int cmt_seq, int adt_seq) {
		mapper.adoptBoardCmtDelete(cmt_seq);
		return "redirect:/adtinfo.do?adt_seq=" + adt_seq;
	}

	@RequestMapping("/sponBoardCmtDelete.do")
	public String sponCmtDelete(int cmt_seq, int spon_seq) {
		mapper.sponBoardCmtDelete(cmt_seq);
		return "redirect:/sponinfo.do?spon_seq=" + spon_seq;
	}

	@RequestMapping("/commBoardCmtDelete.do")
	public String commCmtDelete(int cmt_seq, int article_seq) {
		mapper.commBoardCmtDelete(cmt_seq);
		return "redirect:/comminfo.do?article_seq=" + article_seq;
	}

	// --------------- 게시글 수정페이지로 이동하는 메서드
	@RequestMapping("/adoptUpdateForm.do")
	public String adoptUpdateForm(Model model, int adt_seq) {
		AdoptBoard vo = mapper.adoptBoardInfo(adt_seq);
		model.addAttribute("AdoptBoard", vo);
		return "board/adoptBoardUpdate";
	}

	@RequestMapping("/sponUpdateForm.do")
	public String sponUpdateForm(Model model, int spon_seq) {
		SponBoard vo = mapper.sponBoardInfo(spon_seq);
		model.addAttribute("SponBoard", vo);
		return "board/sponBoardUpdate";
	}

	@RequestMapping("/commUpdateForm.do")
	public String commUpdateForm(Model model, int article_seq) {
		CommBoard vo = mapper.commBoardInfo(article_seq);
		model.addAttribute("CommBoard", vo);
		return "board/commBoardUpdate";
	}

	// -------------- 수정한 게시글 업데이트 해주는 메서드
	@RequestMapping("/adoptBoardUpdate.do")
	public String adoptBoardUpdate(AdoptBoard vo, HttpSession session, @RequestParam("file") MultipartFile file) 
			throws IOException{
		
		// 이미지 변경했을때
		if(!file.isEmpty()) {
			System.out.println("이미지변경함");
			String fileRealName = file.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			String path = session.getServletContext().getRealPath("resources/upload");
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			
			File saveFile = new File(path + "\\" + uniqueName + fileExtension);
			try {
				// 실제 파일에 저장
				file.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			}

			String url = path + "\\" + uniqueName + fileExtension;
			vo.setAdt_url(url);
			vo.setAdt_sname(uniqueName + fileExtension);
			
			mapper.adoptFileUpdate(vo);
		}else { 
			//이미지 변경안함
			System.out.println("이미지 변경안함");
			mapper.adoptBoardUpdate(vo);
		}
		
		return "redirect:/adtinfo.do?adt_seq=" + vo.getAdt_seq();
	}

	@RequestMapping("/sponBoardUpdate.do")
	public String sponBoardUpdate(SponBoard vo, HttpSession session, @RequestParam("file") MultipartFile file) 
			throws IOException{
		
		// 이미지 변경했을때
		if (!file.isEmpty()) {
			System.out.println("이미지변경함");
			String fileRealName = file.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			String path = session.getServletContext().getRealPath("resources/upload");
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];

			File saveFile = new File(path + "\\" + uniqueName + fileExtension);
			try {
				// 실제 파일에 저장
				file.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			}

			String url = path + "\\" + uniqueName + fileExtension;
			vo.setSpon_url(url);
			vo.setSpon_sname(uniqueName + fileExtension);

			mapper.sponFileUpdate(vo);
		} else {
			// 이미지 변경안함
			System.out.println("이미지 변경안함");
			mapper.sponBoardUpdate(vo);
		}

		return "redirect:/sponinfo.do?spon_seq=" + vo.getSpon_seq();
	}

	@RequestMapping("/commBoardUpdate.do")
	public String commBoardUpdate(CommBoard vo, HttpSession session, @RequestParam("file") MultipartFile file) 
			throws IOException{
		// 이미지 변경했을때
		if (!file.isEmpty()) {
			System.out.println("이미지변경함");
			String fileRealName = file.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			String path = session.getServletContext().getRealPath("resources/upload");
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];

			File saveFile = new File(path + "\\" + uniqueName + fileExtension);
			try {
				// 실제 파일에 저장
				file.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			}

			String url = path + "\\" + uniqueName + fileExtension;
			vo.setArticle_url(url);
			vo.setArticle_sname(uniqueName + fileExtension);

			mapper.commFileUpdate(vo);
		} else {
			// 이미지 변경안함
			System.out.println("이미지 변경안함");
			mapper.commBoardUpdate(vo);
		}
		
		return "redirect:/comminfo.do?article_seq=" + vo.getArticle_seq();
	}

	// ---------------
	@RequestMapping("/adoptSearch.do")
	public String adoptboardsearch(Model model, AdoptBoard vo) {
		List<AdoptBoard> adoptSearchList = mapper.adoptBoardSearch(vo);
		model.addAttribute("adoptSearchList", adoptSearchList);
		return "board/adopt";
	}
	
	
	
	
	// ------------------------------- 펫케어 ----------------------------------------
	//펫케어로 이동
	@RequestMapping("/petcare.do")
	public String getPetcare(Model model) {
		List<Petcare> petCareList = mapper.selectPetcareList();
		model.addAttribute("petCareList", petCareList);
		return "petcare";
	}
	
	//펫케어 상세정보로 이동+리뷰출력
	@RequestMapping("/petcareInfo.do/{petcare_seq}")
	public String getPetcareReview(Model model, @PathVariable int petcare_seq) {
		List<PetcareReview> petCareReviewList = mapper.selectPetcareReviewList(petcare_seq);
		model.addAttribute("petCareReviewList", petCareReviewList);
		return "petcareInfo";
	}

}

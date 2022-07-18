package com.smhrd.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.smhrd.domain.AdoptBoard;
import com.smhrd.domain.AdoptComment;
import com.smhrd.domain.CommBoard;
import com.smhrd.domain.CommComment;
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
	public String adoptBoardInfo(Model model, int adt_seq) {
		mapper.adoptCntUpdate(adt_seq);
		model.addAttribute("adt_seq", adt_seq);
		AdoptBoard adoptInfo = mapper.adoptBoardInfo(adt_seq);
		model.addAttribute("adoptInfo", adoptInfo);		
		List<AdoptComment> adoptCommentList = (List<AdoptComment>) mapper.adoptCommentList(adt_seq);
		model.addAttribute("adoptCommentList", adoptCommentList);	
		return "board/adoptInfo";
	}

	@RequestMapping("comminfo.do")
	public String commBoardInfo(Model model, int article_seq) {
		mapper.commCntUpdate(article_seq);
		model.addAttribute("article_seq", article_seq);
		CommBoard commInfo = mapper.commBoardInfo(article_seq);
		model.addAttribute("commInfo", commInfo);
		List<CommComment> commCommentList = (List<CommComment>) mapper.commCommentList(article_seq);
		model.addAttribute("commCommentList", commCommentList);
		return "board/commInfo";
	}

	@RequestMapping("sponinfo.do")
	public String sponBoardInfo(Model model, int spon_seq) {
		mapper.sponCntUpdate(spon_seq);
		model.addAttribute("spon_seq", spon_seq);
		SponBoard sponInfo = mapper.sponBoardInfo(spon_seq);
		model.addAttribute("sponInfo", sponInfo);
		List<SponComment> sponCommentList = (List<SponComment>) mapper.sponCommentList(spon_seq);
		model.addAttribute("sponCommentList", sponCommentList);
		return "board/sponInfo";
	}

	// ---------------- 게시글 작성페이지로 이동하는 메서드

	@GetMapping("/adoptBoardInsert.do")
	public String adoptBoardForm() {
		return "board/adoptBoardForm";
	}

	@GetMapping("/commBoardInsert.do")
	public String commBoardForm() {
		return "board/commBoardForm";
	}

	@GetMapping("/sponBoardInsert.do")
	public String sponBoardForm() {
		return "board/sponBoardForm";
	}

	// ----------- 게시글 등록하는 메서드
	@PostMapping("/adoptBoardInsert.do")
	public String adoptInsert(AdoptBoard vo) {
		mapper.adoptBoardInsert(vo);
		return "redirect:/adopt.do";
	}

	@PostMapping("/commBoardInsert.do")
	public String commInsert(CommBoard vo) {
		mapper.commBoardInsert(vo);
		return "redirect:/comm.do";
	}

	@PostMapping("/sponBoardInsert.do")
	public String boardForm(SponBoard vo) {
		mapper.sponBoardInsert(vo);
		return "redirect:/spon.do";
	}
	
	//----------- 댓글 등록하는 메서드
	@RequestMapping("/adoptCommentInsert.do")
	public String adoptComment(AdoptComment vo) {		
		mapper.adoptCommentInsert(vo);
		return "redirect:/adtinfo.do?adt_seq="+vo.getAdt_seq();
	}
	
	@RequestMapping("/commCommentInsert.do")
	public String commComment(CommComment vo) {		
		mapper.commCommentInsert(vo);
		return "redirect:/comminfo.do?article_seq="+vo.getArticle_seq();
	}
	
	@RequestMapping("/sponCommentInsert.do")
	public String sponComment(SponComment vo) {		
		mapper.sponCommentInsert(vo);
		return "redirect:/sponinfo.do?spon_seq="+vo.getSpon_seq();
	}
	
	
	//---------- 게시글 삭제 메서드
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
	
	//--------- 댓글 삭제 메서드
	@RequestMapping("/adoptBoardCmtDelete.do")
	public String adoptCmtDelete(int cmt_seq, int adt_seq) {
		mapper.adoptBoardCmtDelete(cmt_seq);
		return "redirect:/adtinfo.do?adt_seq="+adt_seq;
	}
	@RequestMapping("/sponBoardCmtDelete.do")
	public String sponCmtDelete(int cmt_seq, int spon_seq) {
		mapper.sponBoardCmtDelete(cmt_seq);
		return "redirect:/sponinfo.do?spon_seq="+spon_seq;
	}
	@RequestMapping("/commBoardCmtDelete.do")
	public String commCmtDelete(int cmt_seq, int article_seq) {
		mapper.commBoardCmtDelete(cmt_seq);
		return "redirect:/comminfo.do?article_seq="+article_seq;
	}
	
	//--------------- 게시글 수정페이지로 이동하는 메서드
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
	
	//-------------- 수정한 게시글 업데이트 해주는 메서드
	@RequestMapping("/adoptBoardUpdate.do")
	public String adoptBoardUpdate(AdoptBoard vo) {
		mapper.adoptBoardUpdate(vo);
		return "redirect:/adtinfo.do?adt_seq="+vo.getAdt_seq();
	}
	@RequestMapping("/sponBoardUpdate.do")
	public String sponBoardUpdate(SponBoard vo) {
		mapper.sponBoardUpdate(vo);
		return "redirect:/sponinfo.do?spon_seq="+vo.getSpon_seq();
	}
	@RequestMapping("/commBoardUpdate.do")
	public String commBoardUpdate(CommBoard vo) {
		mapper.commBoardUpdate(vo);
		return "redirect:/comminfo.do?article_seq="+vo.getArticle_seq();
	}
	
	//--------------
	
	


}

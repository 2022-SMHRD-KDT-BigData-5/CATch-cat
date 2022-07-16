package com.smhrd.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

		model.addAttribute("adt_seq", adt_seq);

		AdoptBoard adoptInfo = mapper.adoptBoardInfo(adt_seq);
		model.addAttribute("adoptInfo", adoptInfo);

		List<AdoptComment> adoptCommentList = (List<AdoptComment>) mapper.adoptCommentList(adt_seq);
		model.addAttribute("adoptCommentList", adoptCommentList);

		return "board/adoptInfo";
	}

	@RequestMapping("comminfo.do")
	public String commBoardInfo(Model model, int article_seq) {

		model.addAttribute("article_seq", article_seq);

		CommBoard commInfo = mapper.commBoardInfo(article_seq);
		model.addAttribute("commInfo", commInfo);

		List<CommComment> commCommentList = (List<CommComment>) mapper.commCommentList(article_seq);
		model.addAttribute("commCommentList", commCommentList);

		return "board/commInfo";
	}

	@RequestMapping("sponinfo.do")
	public String sponBoardInfo(Model model, int spon_seq) {

		model.addAttribute("spon_seq", spon_seq);

		SponBoard sponInfo = mapper.sponBoardInfo(spon_seq);
		model.addAttribute("sponInfo", sponInfo);

		List<SponComment> sponCommentList = (List<SponComment>) mapper.sponCommentList(spon_seq);
		model.addAttribute("sponCommentList", sponCommentList);

		return "board/sponInfo";
	}

	// 게시글과 댓글을 입력하는 메서드
	@RequestMapping("commentInsert.do")
	public void commentInsert() {
		// 로그인 완성 후 세션의 사용자아이디 받아올 수 있음
	}


	// ---------- 게시글 작성페이지 이동하는 메서드

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
		return "redirect:/adopt.do"; //adtinfo.do?adt_seq=1
	}
	
	@RequestMapping("/commCommentInsert.do")
	public String commComment(CommComment vo) {		
		mapper.commCommentInsert(vo);
		return "redirect:/comm.do"; //comminfo.do?article_seq=1
	}
	
	@RequestMapping("/sponCommentInsert.do")
	public String sponComment(SponComment vo) {		
		mapper.sponCommentInsert(vo);
		return "redirect:/spon.do"; //sponinfo.do?spon_seq=1
	}

}

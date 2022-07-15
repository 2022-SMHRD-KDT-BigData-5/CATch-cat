package com.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
		return "adopt";
	}
	
	@RequestMapping("/comm.do")
	public String commboard(Model model) {
		List<CommBoard> commList = mapper.commBoardList();
		model.addAttribute("commList", commList);
		return "comm";
	}
	
	@RequestMapping("/spon.do")
	public String sponboard(Model model) { 
		List<SponBoard> sponList = mapper.sponBoardList();
		model.addAttribute("sponList", sponList);
		return "spon";
	}
	
	
	
	// ---------------------- 게시글 상세페이지로 이동하는 메서드(board_seq 받아서 댓글 + 게시글 전체정보 출력)
	
	@RequestMapping("adtinfo.do") 
	public String adoptBoardInfo(Model model, int adt_seq) {
		
		model.addAttribute("adt_seq", adt_seq);
		
		AdoptBoard adoptInfo = mapper.adoptBoardInfo(adt_seq);
		model.addAttribute("adoptInfo", adoptInfo);
		
		List<AdoptComment> adoptCommentList = (List<AdoptComment>)mapper.adoptCommentList(adt_seq);
		model.addAttribute("adoptCommentList", adoptCommentList);
		
		return "adoptInfo";
	}
	
	@RequestMapping("comminfo.do") 
	public String commBoardInfo(Model model, int article_seq) {
		
		model.addAttribute("article_seq", article_seq);
		
		CommBoard commInfo = mapper.commBoardInfo(article_seq);
		model.addAttribute("commInfo", commInfo);
		
		List<CommComment> commCommentList = (List<CommComment>)mapper.commCommentList(article_seq);
		model.addAttribute("commCommentList", commCommentList);
		
		return "commInfo";
	}
	
	@RequestMapping("sponinfo.do") 
	public String sponBoardInfo(Model model, int spon_seq) {
		
		model.addAttribute("spon_seq", spon_seq);
		
		SponBoard sponInfo = mapper.sponBoardInfo(spon_seq);
		model.addAttribute("sponInfo", sponInfo);
		
		List<SponComment> sponCommentList = (List<SponComment>)mapper.sponCommentList(spon_seq);
		model.addAttribute("sponCommentList", sponCommentList);
		
		return "sponInfo";
	}
	
	
	
	//게시글과 댓글을 입력하는 메서드
	
	@RequestMapping("commentInsert.do")
	public void commentInsert() {
		//로그인 완성 후 세션의 사용자아이디 받아올 수 있음
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

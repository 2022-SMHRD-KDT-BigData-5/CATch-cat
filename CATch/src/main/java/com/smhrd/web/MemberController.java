package com.smhrd.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.domain.Member;
import com.smhrd.mapper.MemberMapper;

@Controller
public class MemberController {
	
	// mybatis 연결
	@Autowired
	MemberMapper mapper;
	
	// 회원가입페이지 이동
	@GetMapping("/join.do")
	public String joinForm() {
		
		return "joinForm";
	}
	
	// 아이디중복체크
	@GetMapping("/idCheck.do")
	public int idCheck(String userid) {
		int check =0;
		
		System.out.println("들어가긴함?");
		String id = mapper.selectId(userid);
		
		if(id!=null) {
			System.out.println("ID중복O");
			check = 0;
		}else {
			System.out.println("ID중복X");
			check = 1;
		}
		
		System.out.println(check);
		return check;
		
	}
	
	
	
	
	
	// 회원가입
	@PostMapping("/join.do")
	public String join(Member vo) {
		
		mapper.insertMember(vo);
		
		return "redirect:/main.do";
	}
	
	// 로그인페이지 이동
	@GetMapping("/login.do")
	public String loginForm() {
		
		return "loginForm";
	}
	
	// 로그인하기
	@PostMapping("/login.do")
	public String login(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		//로그인아이디 콘솔창 출력
		System.out.println(mem_id + mem_pw);
		
		Member loginMember = new Member(mem_id, mem_pw); 
		Member member = mapper.selectMember(loginMember);
		session.setAttribute("member", member);
		if(member != null) {
			System.out.println("로그인 성공");
		}else {
			System.out.println("로그인 실패");
		}
		
			return "redirect:/main.do";
	
		}
		
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		
		return "myCat";
	}
	
	
	
	
	}
	
	
	
	
	
	

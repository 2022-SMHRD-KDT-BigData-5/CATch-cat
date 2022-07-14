package com.smhrd.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String login(Member vo) {
		
		Member loginMember = mapper.selectMember(vo);
		
		if(loginMember != null) {
			System.out.println("로그인 성공");
		}
		else {
			System.out.println("로그인 실패");
		}
		
		
		
		
		return "redirect:/main.do";
	}
	
	
	
	
	
	
}

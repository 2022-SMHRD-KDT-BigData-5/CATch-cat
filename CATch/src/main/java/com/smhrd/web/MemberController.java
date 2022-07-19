package com.smhrd.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.domain.CatCard;
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
	@PostMapping("/idCheck.do")
	@ResponseBody
	public int idCheck(@RequestParam("userid") String userid) {
		int check =0;
		
		check = mapper.selectId(userid);
		
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
			return "redirect:/login.do";
		}
		
			return "redirect:/main.do";
	
		}
	
	// 로그아웃하기
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("member");
		return "redirect:/main.do";
	}
		
	
	//마이페이지의 캣카드로 이동
	@RequestMapping("/mypage.do")
	public String mypage(String mem_id, HttpServletRequest request) {
		List<CatCard> catcardList = mapper.selectMyCat(mem_id);
		
		HttpSession session = request.getSession();
		session.setAttribute("catcardList", catcardList);
		return "myCat";
	}
	
	//마이페이지의 회원정보수정으로 이동
	@RequestMapping("/myInfoCheck.do")
	public String myInfoCheck() {
		return "myInfoCheck";
	}
	
	@RequestMapping("/myInfo.do")
	public String myInfo(String mem_id, String mem_pw, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member loginMember = new Member(mem_id, mem_pw);
		Member member = mapper.selectMember(loginMember);
		session.setAttribute("member", member);
		
		return "myInfo";
	}
	
	@RequestMapping("/myInfoUpdate.do")
	public String myInfoUpdate() {
		
		return "redirect:/main.do";
	}
	
	}
	
	
	
	
	
	

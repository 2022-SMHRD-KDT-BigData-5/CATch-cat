package com.smhrd.mapper;

import com.smhrd.domain.Member;

// 추상메서드 interface
public interface MemberMapper {
	
	public int insertMember(Member vo);
	
	public Member selectMember(Member vo); 
	
	
	
	
	
	
}

package com.smhrd.mapper;

import com.smhrd.domain.Member;

// 추상메서드 interface
public interface MemberMapper {
	
	public abstract int insertMember(Member vo);
	
	public abstract Member selectMember(Member loginMember); 
	
	public int selectId(String userid);
	
	
	
	
	
}

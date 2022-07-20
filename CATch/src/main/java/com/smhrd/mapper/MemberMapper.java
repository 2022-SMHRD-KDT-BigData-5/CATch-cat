package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.CareBoard;
import com.smhrd.domain.CatCard;
import com.smhrd.domain.Member;

// 추상메서드 interface
public interface MemberMapper {
	
	public abstract int insertMember(Member vo);
	
	public abstract Member selectMember(Member loginMember); 
	
	public int selectId(String userid);
	
	
	//마이페이지 캣카드 조회
	public abstract List<CatCard> selectMyCat(String mem_id);
	

}

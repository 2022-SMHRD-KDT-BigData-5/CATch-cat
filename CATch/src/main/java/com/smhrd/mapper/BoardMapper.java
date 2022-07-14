package com.smhrd.mapper;

import java.util.List;


import com.smhrd.domain.CareBoard;



import com.smhrd.domain.AdoptBoard;
import com.smhrd.domain.CommBoard;
import com.smhrd.domain.SponBoard;

public interface BoardMapper {
	
	
	//db에서 게시글 전체정보 가져오는 추상메서드
	// 태그에 주는 id == 메서드 이름
	public abstract List<AdoptBoard> adoptBoardList();
	
	public abstract List<CommBoard> commBoardList();
	
	public abstract List<SponBoard> sponBoardList();
	
	
	

	//
	public List<CareBoard> careList();
	

	
	
	
	



}

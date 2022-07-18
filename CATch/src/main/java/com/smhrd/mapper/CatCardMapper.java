package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.CatCard;

public interface CatCardMapper {
	
	//캣카드 번호로 캣카드 전체정보 조회하는 메서드
	public abstract CatCard seqSearch(int cat_seq);
	

}

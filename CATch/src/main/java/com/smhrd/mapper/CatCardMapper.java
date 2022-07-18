package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.CatCard;
import com.smhrd.domain.Medical;
import com.smhrd.domain.Vaccination;

public interface CatCardMapper {
	
	//캣카드 번호로 캣카드 전체정보 조회하는 메서드
	public abstract CatCard seqCatSearch(int cat_seq);
	public abstract List<Medical> seqMediSearch(int cat_seq);
	public abstract List<Vaccination> seqVaccSearch(int cat_seq);
	

}

package com.smhrd.mapper;

import java.sql.Timestamp;
import java.util.List;

import com.smhrd.domain.CatCard;
import com.smhrd.domain.Medical;
import com.smhrd.domain.Vaccination;

public interface CatCardMapper {
	
	//캣카드 번호로 캣카드 전체정보 조회하는 메서드
	public abstract CatCard seqCatSearch(int cat_seq);
	public abstract List<Medical> seqMediSearch(int cat_seq);
	//캣카드번호로 접종내역 조회하는 메서드
	//종합백신 차수
	public abstract List<Vaccination> jhSearch(int cat_seq);
	//광견병 여부
	public abstract List<Vaccination> ggSearch(int cat_seq);
	//전염성 복막염 여부
	public abstract List<Vaccination> jbSearch(int cat_seq);
	//항체가검사 여부
	public abstract List<Vaccination> hcSearch(int cat_seq);
	//심장사상충 마지막 접종일
	public abstract List<Vaccination> ssSearch(int cat_seq);
	
	

}

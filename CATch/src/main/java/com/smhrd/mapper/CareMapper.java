
package com.smhrd.mapper;



import java.util.List;

import com.smhrd.domain.CareBoard;
import com.smhrd.domain.CatCard;


public interface CareMapper {

	//db에 고양터 저장
	public abstract int insertAddress(CareBoard careBoard);
	
	//db에서 모든 고양터 데이터 가져오기
	public abstract List<CareBoard> selectCareZone();
	
	//특정 급식소에 등록된 모든 고양이 데이터 가져오기
	public abstract List<CatCard> selectCareCatCard(int cat_carezone);
	
	//급식소에 사는 모든 고양이 가져오기
	public abstract List<CatCard> selectAllCareCatcard();
	
	


	

	

}


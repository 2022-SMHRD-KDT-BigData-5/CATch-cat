
package com.smhrd.mapper;



import java.util.List;

import com.smhrd.domain.CareBoard;


public interface CareMapper {

	//db에 고양터 저장
	public abstract int insertAddress(CareBoard careBoard);
	
	//db에서 모든 고양터 데이터 가져오기
	public abstract List<CareBoard> selectCareZone();
	
	


	

	

}


package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.Petcare;
import com.smhrd.domain.PetcareAdmin;
import com.smhrd.domain.PetcareReview;

public interface PetcareMapper {
	
	
	// 펫케어 전체정보 가져오기 
	public abstract List<Petcare> selectPetcareList();
	
	//펫케어 상세정보 가져오기
	public abstract Petcare selectPetcare(int petcare_seq);
	
	// 펫케어 리뷰 가져오기
	public abstract List<PetcareReview> selectPetcareReviewList(int petcare_seq);
	
	//펫케어 리뷰 등록하기
	public abstract int insertReview(PetcareReview petcareReview);
	
	
	
	// ----------------------------------- admin -----------------------------------------------
	
	// 업체 이용기록 등록
	public abstract int insertPetcareAdmin(PetcareAdmin petcareAdmin);
	
	// 업체 이용기록 조회
	public abstract List<PetcareAdmin> selectPetcareAdmin(String admin_id);

}

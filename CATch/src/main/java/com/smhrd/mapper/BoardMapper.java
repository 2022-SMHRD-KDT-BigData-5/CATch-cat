package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.smhrd.domain.AdoptBoard;
import com.smhrd.domain.AdoptComment;
import com.smhrd.domain.CommBoard;
import com.smhrd.domain.CommComment;
import com.smhrd.domain.Petcare;
import com.smhrd.domain.PetcareReview;
import com.smhrd.domain.SponBoard;
import com.smhrd.domain.SponComment;

public interface BoardMapper {
	
	
	//db에서 게시글 전체정보 가져오는 추상메서드
	// 태그에 주는 id == 메서드 이름
	public abstract List<AdoptBoard> adoptBoardList();
	
	public abstract List<CommBoard> commBoardList();
	
	public abstract List<SponBoard> sponBoardList();
	
	
	//게시글 상세정보 가져오는 추상메서드
	public abstract AdoptBoard adoptBoardInfo(int adt_seq);
	
	public abstract CommBoard commBoardInfo(int article_seq);
	
	public abstract SponBoard sponBoardInfo(int spon_seq);
	
	//게시글의 댓글을 가져오는 추상메서드
	public abstract List<AdoptComment> adoptCommentList(int adt_seq);
	
	public abstract List<CommComment> commCommentList(int comm_seq);
	
	public abstract List<SponComment> sponCommentList(int spon_seq);
	

	// 게시글 작성
	public int adoptBoardInsert(AdoptBoard vo);
	
	public int commBoardInsert(CommBoard vo);
	
	public int sponBoardInsert(SponBoard vo);
	
	// 게시글(이미지)작성
	public int adoptFileInsert(AdoptBoard vo);
	
	public int commFileInsert(CommBoard vo);
	
	public int sponFileInsert(SponBoard vo);
	
	// 댓글 작성
	public int adoptCommentInsert(AdoptComment vo);
	
	public int commCommentInsert(CommComment vo);
	
	public int sponCommentInsert(SponComment vo);
	
	// 게시글 삭제
	@Delete("delete from t_adoption where adt_seq=#{adt_seq}")
	public int adoptBoardDelete(int adt_seq);

	@Delete("delete from t_sponsorship where spon_seq=#{spon_seq}")
	public int sponBoardDelete(int spon_seq);
	
	@Delete("delete from t_community where article_seq=#{article_seq}")
	public int commBoardDelete(int article_seq);
	
	//게시글 삭제 전 댓글 전체 삭제
	@Delete("delete from t_adoption_cmt where adt_seq=#{adt_seq}")
	public int adoptBoardCommentDelete(int adt_seq);
	
	@Delete("delete from t_community_cmt where article_seq=#{article_seq}")
	public int commBoardCommentDelete(int adt_seq);
	
	@Delete("delete from t_sponsorship_cmt where spon_seq=#{spon_seq}")
	public int sponBoardCommentDelete(int spon_seq);
	
	// 게시글 조회수
	public int adoptCntUpdate(int adt_seq);
	
	public int sponCntUpdate(int spon_seq);
	
	public int commCntUpdate(int article_seq);
	
	// 댓글 삭제
	@Delete("delete from t_adoption_cmt where cmt_seq=#{cmt_seq}")
	public int adoptBoardCmtDelete(int cmt_seq);
	
	@Delete("delete from t_sponsorship_cmt where cmt_seq=#{cmt_seq}")
	public int sponBoardCmtDelete(int cmt_seq);
	
	@Delete("delete from t_community_cmt where cmt_seq=#{cmt_seq}")
	public int commBoardCmtDelete(int cmt_seq);
	
	// 게시글 수정
	public int adoptBoardUpdate(AdoptBoard vo);
	
	public int sponBoardUpdate(SponBoard vo);
	
	public int commBoardUpdate(CommBoard vo);
	
	// 게시글(이미지) 수정
	public int adoptFileUpdate(AdoptBoard vo);
	
	public int sponFileUpdate(SponBoard vo);
	
	public int commFileUpdate(CommBoard vo);
	
	
	// 게시글 검색
	public abstract List<AdoptBoard> adoptBoardSearch(AdoptBoard vo);	
	
	
	// 펫케어 전체정보 가져오기 
	public abstract List<Petcare> selectPetcareList();
	
	// 펫케어 리뷰 가져오기
	public abstract List<PetcareReview> selectPetcareReviewList(int petcare_seq);

}

package com.smhrd.mapper;

import java.util.List;




import com.smhrd.domain.AdoptBoard;
import com.smhrd.domain.AdoptComment;
import com.smhrd.domain.CommBoard;
import com.smhrd.domain.CommComment;
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

	

	// 게시글 작성하는 추상메서드
	public int adoptBoardInsert(AdoptBoard vo);
	
	public int commBoardInsert(CommBoard vo);
	
	public int sponBoardInsert(SponBoard vo);
	
	
	



}

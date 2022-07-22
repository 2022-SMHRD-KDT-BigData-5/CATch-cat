package com.smhrd.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class CommComment {
	private int cmt_seq;
	@NonNull
	private int article_seq;
	@NonNull
	private String cmt_content;
	private Timestamp cmt_date;
	@NonNull
	private String cmt_id;

}

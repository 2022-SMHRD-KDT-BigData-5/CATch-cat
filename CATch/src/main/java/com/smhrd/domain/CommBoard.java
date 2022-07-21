package com.smhrd.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommBoard {
	
	private int article_seq;
	private String article_title;
	private String article_content;
	private Timestamp article_date;
	private int article_cnt;
	private String article_id;
	
	//이미지저장
	private String article_url;
	private String article_sname;
}

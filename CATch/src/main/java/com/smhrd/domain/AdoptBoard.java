package com.smhrd.domain;

import java.sql.Timestamp;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdoptBoard {
	
	private int adt_seq;
	private String adt_title;
	private String adt_content;
	private Timestamp adt_date;
	private int adt_cnt;
	private String adt_id;
	
	// 파일저장경로
	private String adt_url;
	private String adt_sname;
	
	private String field;
	private String query;
	
	
}

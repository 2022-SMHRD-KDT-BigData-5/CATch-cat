package com.smhrd.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SponBoard {
	
	private int spon_seq;
	private String spon_title;
	private String spon_content;
	private Timestamp spon_date;
	private int spon_cnt;
	private String spon_id;

}

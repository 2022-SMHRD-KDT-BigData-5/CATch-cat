package com.smhrd.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SponComment {
	private int cmt_seq;
	private int spon_seq;
	private String cmt_content;
	private Timestamp cmt_date;
	private String cmt_id;
	

}

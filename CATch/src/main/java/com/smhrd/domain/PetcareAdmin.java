package com.smhrd.domain;

import java.sql.Date;
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
public class PetcareAdmin {
	private int admin_seq;
	@NonNull
	private String admin_name;
	@NonNull
	private String admin_cate;
	@NonNull
	private int admin_catcard;
	@NonNull
	private Timestamp admin_date;
	@NonNull
	private String admin_content;
	@NonNull
	private String admin_id;
	

}

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
public class CatCard {

	private int cat_seq;
	@NonNull
	private String cat_name;
	@NonNull
	private Date cat_birthdate;
	@NonNull
	private char cat_gender;
	
	private Timestamp cat_date;

	private String cat_nose;
	@NonNull
	private char cat_neutral;
	
	@NonNull
	private String mem_id;
	
	@NonNull
	private String cat_spec;
	
	
	//이미지 저장
	private String cat_url;
	private String cat_sname;
	
	//급식소
	private int cat_carezone;


}

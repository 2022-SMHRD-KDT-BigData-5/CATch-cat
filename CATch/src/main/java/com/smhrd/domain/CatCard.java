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
public class CatCard {

	private int cat_seq;
	private String cat_name;
	private Date cat_birthdate;
	private char cat_gender;
	private Timestamp cat_date;
	private String cat_nose;
	private String mem_id;
	private char cat_neutral;
	

}

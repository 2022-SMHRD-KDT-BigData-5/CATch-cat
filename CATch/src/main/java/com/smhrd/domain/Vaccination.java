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
public class Vaccination {
	private int vacc_seq;
	
	@NonNull
	private String vacc_type;
	
	private Timestamp vacc_date;
	
	@NonNull
	private String medi_id;
	
	@NonNull
	private String medi_name;
	
	@NonNull
	private int cat_seq;


}

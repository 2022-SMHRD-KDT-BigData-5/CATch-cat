package com.smhrd.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Vaccination {
	private int vacc_seq;
	private String vacc_type;
	private Timestamp vacc_date;
	private String medi_id;
	private String medi_name;
	private int cat_seq;


}

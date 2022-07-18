package com.smhrd.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Medical {
	private int medi_seq;
	private String medi_id;
	private String medi_name;
	private Timestamp medi_date;
	private String medi_content;
	private int cat_seq;

}

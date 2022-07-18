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
public class Medical {
	private int medi_seq;
	@NonNull
	private String medi_id;
	@NonNull
	private String medi_name;
	private Timestamp medi_date;
	@NonNull
	private String medi_content;
	@NonNull
	private int cat_seq;

}

package com.smhrd.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Petcare {
	private int petcare_seq;
	private String petcare_name;
	private String petcare_thumb;
	private String petcare_cate;
	private String petcare_detail;

}

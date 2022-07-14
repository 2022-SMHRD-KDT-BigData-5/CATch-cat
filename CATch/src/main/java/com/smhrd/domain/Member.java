package com.smhrd.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_phone;
	private char mem_hospital;
	
}

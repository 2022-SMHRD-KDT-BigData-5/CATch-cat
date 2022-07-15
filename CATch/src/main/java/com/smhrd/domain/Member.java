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
@RequiredArgsConstructor //필요한 필드만 요소로 갖는 생성자 생성
public class Member {
	
	@NonNull
	private String mem_id;
	@NonNull
	private String mem_pw;
	
	private String mem_name;
	private String mem_phone;
	private char mem_hospital;
	
}

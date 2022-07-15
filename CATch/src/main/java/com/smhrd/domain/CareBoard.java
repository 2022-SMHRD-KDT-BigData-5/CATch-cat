package com.smhrd.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
@Data // 기본 메서드 (Getter/Setter/toString) 생성
@AllArgsConstructor // 모든 필드를 요소로 갖는 생성자 생성
@NoArgsConstructor // 기본 생성자
public class CareBoard {

	private int care_seq;	
	private String care_name;
	private String care_addr;
	private String care_latitude;
	private String care_longitude;
	private String cat_seq;
	private String care_id;
	private String care_date;
}

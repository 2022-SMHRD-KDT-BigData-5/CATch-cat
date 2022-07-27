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
public class PetcareReview {
	private int review_seq;
	@NonNull
	private String review_id;
	@NonNull
	private String review_content;
	@NonNull
	private int review_petcare;
	@NonNull
	private int review_star;
	private Timestamp review_date;
}

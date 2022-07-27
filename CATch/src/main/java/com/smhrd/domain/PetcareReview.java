package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PetcareReview {
	private int review_seq;
	private String review_id;
	private String review_content;
	private int review_petcare;
}

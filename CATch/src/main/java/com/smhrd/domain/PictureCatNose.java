package com.smhrd.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PictureCatNose {
	
	private String mem_id;
	private int cat_seq;
	private String original_file_name;
	private String stored_file_path;
	private long file_size;
}

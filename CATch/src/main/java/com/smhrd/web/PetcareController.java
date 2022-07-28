package com.smhrd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.smhrd.mapper.PetcareMapper;

@Controller
public class PetcareController {
	
	@Autowired
	PetcareMapper mapper;

}

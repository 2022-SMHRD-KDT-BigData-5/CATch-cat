package com.smhrd.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.smhrd.domain.CareBoard;

import com.smhrd.mapper.CareMapper;

@Controller	
public class CareController {

	@Autowired
	CareMapper mapper;
	
	
	//
	@RequestMapping("/caremap.do")
	public String carelist( CareBoard care_latitude,CareBoard care_longitude,  ModelMap model)  {
  
	        
	    return "map";
	}
	
	@ResponseBody
	@RequestMapping("/markerChk.do")
	public HashMap <String, String> markerChk(   ModelMap model, HttpServletRequest request) {
		HashMap<String, String> result = new HashMap <String,String>();
		
		String lat = request.getParameter("LAT");
		String log = request.getParameter("LNG");
		
		CareBoard list = new CareBoard();
		
		list.setCare_latitude(lat);
		list.setCare_longitude(log);
		
		int insertRst = mapper.latlng();
		System.out.println(insertRst);
		
		if ( insertRst > 0) {
			String Msg = "성공";
			String Code = "0";
			
			result.put("Msg", Msg);
			result.put("Code", Code);
			
			return result;
		} else {
			String Msg = "실패ㅔ";
			String Code = "1";
			
			result.put("Msg", Msg);
			result.put("Code", Code);
			
			return result;
		}
	}



	
}
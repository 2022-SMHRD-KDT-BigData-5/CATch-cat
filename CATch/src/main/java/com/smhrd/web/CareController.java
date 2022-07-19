package com.smhrd.web;

import java.util.HashMap;


import javax.servlet.http.HttpServletRequest;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.smhrd.domain.CareBoard;
import com.smhrd.domain.CatCard;
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
	public HashMap <String, String> markerChk(@RequestParam("LAT") String LAT,@RequestParam("LNG") String LNG,   ModelMap model, HttpServletRequest request) {
		HashMap<String, String> result = new HashMap <String,String>();
		int inserRst = 0;
		
		String lat = request.getParameter("LAT");
		String log = request.getParameter("LNG");
		System.out.println(lat);
		System.out.println(log);
		
		CareBoard list = new CareBoard();
		
		list.setCare_latitude(lat);
		list.setCare_longitude(log);
		
		CatCard insertRst = mapper.latlng();
		if ( inserRst > 0) {
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
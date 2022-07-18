package com.smhrd.web;

import java.util.HashMap;


import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("/markerChk")
	@ResponseBody
	public HashMap <String, String> markerChk( @RequestBody String message, HttpServletRequest request) {
		HashMap<String, String> result = new HashMap <String,String>();
		
//		String lat = request.getParameter("LAT");
//		String log = request.getParameter("LNG");
//		
//		CareBoard list = new CareBoard();
//		
//		list.setCare_latitude(lat);
//		list.setCare_longitude(log);
//		
	int insertRst = mapper.messageInsert();
//		
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
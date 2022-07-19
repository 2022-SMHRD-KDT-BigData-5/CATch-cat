package com.smhrd.web;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;




import com.smhrd.domain.CareBoard;

import com.smhrd.mapper.CareMapper;

@Controller	
public class CareController {

	@Autowired
	CareMapper mapper;
	
	
	
	@RequestMapping("/caremap.do")
	public String carelist(ModelMap model,HttpServletRequest request, CareBoard careBoard)  {
		
		System.out.println(careBoard.getCare_latitude() + careBoard.getCare_longitude()+careBoard.getCare_name());
		int cnt=0;
		cnt = mapper.insertLALO(careBoard);
		
		
	    return "map";
	}

	
	

	//private void insert(CareBoard place) {
		// TODO Auto-generated method stub
		
	}
	
//	@ResponseBody
//	@RequestMapping("/markerChk.do")
//	public int markerChk(@RequestParam("data") String data,   ModelMap model, HttpServletRequest request) {
//		HashMap<String, String> result = new HashMap <String,String>();
//		
//		
//		String lat = request.getParameter("data");
//		
//		System.out.println(data);
//		
//		
//		CareBoard list = new CareBoard();
//		
//		list.setCare_latitude(lat);
//		
//		
//		int insertRst = mapper.latlng();
//		
//		if ( insertRst  > 0) {
//			String Msg = "성공";
//			String Code = "0";
//			
//			result.put("Msg", Msg);
//			result.put("Code", Code);
//			
//			return insertRst;
//		} else {
//			String Msg = "실패ㅔ";
//			String Code = "1";
//			
//			result.put("Msg", Msg);
//			result.put("Code", Code);
//			
//			return insertRst;
//		}
//	}
//	@RequestMapping(value="/markerChk.do", method= {RequestMethod.GET, RequestMethod.POST})
//    @ResponseBody
//    public List<Map<String, String>> markerChk() {
//        
//        List<Map<String, String>>container = new ArrayList<>();
//        container = museumService.getGeoLocation();
//        
//        return container;
//    }

	


	

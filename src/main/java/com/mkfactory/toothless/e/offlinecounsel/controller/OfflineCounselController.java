package com.mkfactory.toothless.e.offlinecounsel.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.e.offlinecounsel.service.OfflineCounselServiceImpl;

@Controller
@RequestMapping("/tl_e/offlineCounsel/*")
public class OfflineCounselController {
	
	@Autowired
	OfflineCounselServiceImpl OfflineCounselService; 
	
	@RequestMapping("selectCounselorPage")
	public String selectCounselorPage() {
		
		return "tl_e/offlineCounsel/selectCounselorPage";
	}
	
	@RequestMapping("counselReservationPage")
	public String counselReservationPage(Model model) {
		
		List<Map<String, Object>> sevenDaysList = OfflineCounselService.sevenDaysDateExtraction();
		model.addAttribute("sevenDaysList", sevenDaysList);
		
		return "tl_e/offlineCounsel/counselReservationPage";
	}
	
	@RequestMapping("counselReservationProcess")
	public String counselReservationProcess(String counsel_hour) {
		
		// 밑에 로직 추후 sevice단에서 구현하고 예약dto에 년,월,일,시 각각 set해주면 됨... 
		System.out.println(counsel_hour);
		String str[] = counsel_hour.split("\\.");
		int[] dayInfo = new int[4];
		
		for(int i = 0; i < str.length; i++) {
			dayInfo[i] = Integer.parseInt(str[i]);
			System.out.println(dayInfo[i]);
			System.out.println("------");
		}
		
		return "";
	}
	
	
	
}

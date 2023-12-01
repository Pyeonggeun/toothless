package com.mkfactory.toothless.d.jm.consulting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/t1_d/consulting/*")
public class ConsultingController {
	
	@RequestMapping("hopeJobApplyProcess")
	//구직희망 dto넣기
	public String insertHopeJobApply() {
		
		return "";
	}
}

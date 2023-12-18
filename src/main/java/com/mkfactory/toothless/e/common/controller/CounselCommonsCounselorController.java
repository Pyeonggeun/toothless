package com.mkfactory.toothless.e.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_e/commons/*")
public class CounselCommonsCounselorController {
	
	@RequestMapping("counselCenterCounselorMainPage")
	public String counselCenterCounselorMainPage() {
		
		return "tl_e/commons/counselCenterCounselorMainPage";
	}
	
		
}

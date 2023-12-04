package com.mkfactory.toothless.a.staff.mj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_a/staff/*")
public class DormStaffControllerMj {
	
	// 사감 메인페이지
	@RequestMapping("mj_mainPage")
	public String mj_mainPage() {
		
		return "/tl_a/staff/mj_mainPage";
	}
	

}

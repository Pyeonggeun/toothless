package com.mkfactory.toothless.a.staff.jw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_a/staff/*")
public class DormStaffController {

	@RequestMapping("jw_testPage")
	public String jw_testPage() {
		
		return "/tl_a/staff/jw_testPage";
	}
	
	
	
	
	
}

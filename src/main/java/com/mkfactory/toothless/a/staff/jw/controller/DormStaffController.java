package com.mkfactory.toothless.a.staff.jw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_a/staff/*")
public class DormStaffController {

	@RequestMapping("jw_callAttendSituation")
	public String jw_callAttendSituation() {
		
		return "/tl_a/staff/jw_callAttendSituation";
	}
	
	@RequestMapping("jw_exitSituation")
	public String jw_exitSituation() {
		
		return "/tl_a/staff/jw_exitSituation";
	}
	
	
	
	
}

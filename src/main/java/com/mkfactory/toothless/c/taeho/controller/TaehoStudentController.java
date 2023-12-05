package com.mkfactory.toothless.c.taeho.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_c/taeho/student/*")
public class TaehoStudentController {

	@RequestMapping("writeInternReportPage")
	public String writeInternReportPage() {
		return"tl_c/taeho/student/writeInternReportPage";
	}
	
	
	
	
	
	
	
	
}

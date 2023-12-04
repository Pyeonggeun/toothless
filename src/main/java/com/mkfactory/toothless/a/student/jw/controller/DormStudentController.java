package com.mkfactory.toothless.a.student.jw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_a/student/*")
public class DormStudentController {

	@RequestMapping("jw_mainPage")
	public String jw_mainPage() {
		
		return "/tl_a/student/jw_mainPage";
	}
	
	
	
	
	
}

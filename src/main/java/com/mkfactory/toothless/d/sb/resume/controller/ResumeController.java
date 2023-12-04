package com.mkfactory.toothless.d.sb.resume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_d/sb_resume/*")
public class ResumeController {

	// 이력서 등록 페이지
	@RequestMapping("resumeRegistrationPage")
	public String resumeRegistrationPage() {
		
		return "/tl_d/sb_resume/resumeRegistrationPage";
	}
	
	
	
	
}

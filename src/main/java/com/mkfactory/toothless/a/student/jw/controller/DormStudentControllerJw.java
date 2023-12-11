package com.mkfactory.toothless.a.student.jw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.student.jw.service.DormStudentServiceJw;

@Controller
@RequestMapping("/tl_a/student/*")
public class DormStudentControllerJw {

	@Autowired
	private DormStudentServiceJw dormStudentServiceJw;
	
	@RequestMapping("jw_mainPage")
	public String jw_mainPage() {
		
		return "/tl_a/student/jw_mainPage";
	}
	
	@RequestMapping("jw_exitApplyPage")
	public String jw_exitApplyPage() {
		
		return "/tl_a/student/jw_exitApplyPage";
	}
	
	@RequestMapping("jw_checkDormStudentPointPage")
	public String jw_checkDormStudentPointPage() {
		
		return "/tl_a/student/jw_checkDormStudentPointPage";
	}
	
}

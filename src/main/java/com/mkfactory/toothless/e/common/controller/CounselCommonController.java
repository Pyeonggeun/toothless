package com.mkfactory.toothless.e.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_e/commons/*")
public class CounselCommonController {
	
	@RequestMapping("studentCounselMainPage")
	public String studentCounselMainPage() {
		
		return "tl_e/commons/studentCounselMainPage";
	}
	
	@RequestMapping("staffCounselMainPage")
	public String staffCounselMainPage() {
		
		return "tl_e/commons/staffCounselMainPage";
	}
	
	@RequestMapping("counselorCounselMainPage")
	public String counselorCounselMainPage() {
		
		return "tl_e/commons/counselorCounselMainPage";
	}
	
}

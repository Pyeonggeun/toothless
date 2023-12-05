package com.mkfactory.toothless.c.taeho.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_c/templateForUse/*")
public class testController {

	@RequestMapping("staffTemplate")
	public String staffTemplate() {
		return "tl_c/templateForUse/staffTemplate";
	}
	
	@RequestMapping("studentTemplate")
	public String studentTemplate() {
		return "tl_c/templateForUse/studentTemplate";
	}
	
	@RequestMapping("professorTemplate")
	public String professorTemplate() {
		return "tl_c/templateForUse/professorTemplate";
	}
	
	@RequestMapping("companyTemplate")
	public String companyTemplate() {
		return "tl_c/templateForUse/companyTemplate";
	}
	
}

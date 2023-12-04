package com.mkfactory.toothless.c.taeho.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_c/common/*")
public class testController {

	@RequestMapping("ajdksTemplateForStudent")
	public String ajdksTemplateForStudent() {
		return "tl_c/common/ajdksTemplateForStudent";
	}
	
	@RequestMapping("ajdksTemplateForStaff")
	public String ajdksTemplateForStaff() {
		return "tl_c/common/ajdksTemplateForStaff";
	}
	
	@RequestMapping("ajdksTemplateForProfessor")
	public String ajdksTemplateForProfessor() {
		return "tl_c/common/ajdksTemplateForProfessor";
	}
	
	@RequestMapping("ajdksTemplateForCompany")
	public String ajdksTemplateForCompany() {
		return "tl_c/common/ajdksTemplateForCompany";
	}	
	
}

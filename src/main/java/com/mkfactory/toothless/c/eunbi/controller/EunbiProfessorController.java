package com.mkfactory.toothless.c.eunbi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_c/eunbi/professor/*")
public class EunbiProfessorController {
	
	@RequestMapping("internshipMainPage")
	public String internshipMainPage() {
		
		return "tl_c/eunbi/professor/internshipMainPage";
	}
	
	
	
}

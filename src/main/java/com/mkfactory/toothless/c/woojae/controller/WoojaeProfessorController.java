package com.mkfactory.toothless.c.woojae.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_c/woojae/professor/*")
public class WoojaeProfessorController {

	
	@RequestMapping("ajdksProfessorNoticePage")
	public String ajdksProfessorNoticePage() {
		
		return"tl_c/woojae/professor/ajdksProfessorNoticePage";
	}
	
}

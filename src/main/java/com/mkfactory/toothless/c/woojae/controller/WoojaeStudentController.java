package com.mkfactory.toothless.c.woojae.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_c/woojae/student/*")
public class WoojaeStudentController {

	
	@RequestMapping("ajdksStudentNoticePage")
	public String ajdksStudentNoticePage() {
		
		return"tl_c/woojae/student/ajdksStudentNoticePage";
	}
	
}

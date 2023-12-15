package com.mkfactory.toothless.c.woojae.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.woojae.service.WoojaeStaffServiceImpl;

@Controller
@RequestMapping("/tl_c/woojae/external/*")
public class WoojaeExternalController {
	
	private WoojaeStaffServiceImpl woojaeStaffService;

	@RequestMapping("ajdksInternshipCourseListPage")
	public String ajdksInternshipCourseListPage(Model model) {
		
	
		
		return"tl_c/woojae/external/ajdksInternshipCourseListPage";
	}
}

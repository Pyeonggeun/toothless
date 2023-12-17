package com.mkfactory.toothless.x.ic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_x/ic/*")
public class LifeLecturerController {
	
	@RequestMapping("mainPage")
	public String mainPage() {
		
		
		return "tl_x/ic/mainPage";
	}
	@RequestMapping("lectureManagementPage")
	public String lectureManagementPage(int open_lecture_key) {
		
		return "tl_x/ic/lectureManagementPage";
	}

}

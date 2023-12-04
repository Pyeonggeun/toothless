package com.mkfactory.toothless.a.justStudent.mainPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_a/justStudent/*")
public class MainPageController {

	@RequestMapping("mainPage")
	public String mainPage() {
		
		return "/tl_a/justStudent/mainPage";
	}
	
	
}

package com.mkfactory.toothless.b.hn.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_b/common/*")
public class HealthRoomCommonController {
	
	@RequestMapping("studentMainPage")
	public String studentMainPage() {
		
		return "tl_b/common/studentMainPage";
	}

}

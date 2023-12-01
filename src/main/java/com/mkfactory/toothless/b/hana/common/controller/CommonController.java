package com.mkfactory.toothless.b.hana.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_b_views/common/*")
public class CommonController {
	
	@RequestMapping("studentMainPage")
	public String studentMainPage() {
		
		return "tl_b_views/common/studentMainPage";
	}

}

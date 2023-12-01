package com.mkfactory.toothless.e.onlineCounsel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_e/onlineCounsel/*")
public class OnlineCounselController {

	@RequestMapping("onlineCounselMainPage")
	public String onlineCounselMainPage() {
		
		return "tl_e/onlineCounsel/onlineCounselMainPage";
		
	}
	
	
}

//@Controller
//@RequestMapping("/tl_b/common/*")
//public class CommonController {
//	
//	@RequestMapping("studentMainPage")
//	public String studentMainPage() {
//		
//		return "tl_b/common/studentMainPage";
//	}
//
//}

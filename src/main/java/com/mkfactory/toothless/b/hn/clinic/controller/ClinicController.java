package com.mkfactory.toothless.b.hn.clinic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_b/hn/*")
public class ClinicController {
	
	@RequestMapping("clinicPage")
	public String clinicPage() {
		
		return "tl_b/hn/clinicPage";
	}
}

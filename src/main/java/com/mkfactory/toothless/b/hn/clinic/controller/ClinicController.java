package com.mkfactory.toothless.b.hn.clinic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.b.hn.clinic.service.ClinicServiceImpl;

@Controller
@RequestMapping("/tl_b/hn/*")
public class ClinicController {
	
	@Autowired
	ClinicServiceImpl clinicService;
	
	@RequestMapping("clinicPage")
	public String clinicPage() {
		
		return "tl_b/hn/clinicPage";
	}

}

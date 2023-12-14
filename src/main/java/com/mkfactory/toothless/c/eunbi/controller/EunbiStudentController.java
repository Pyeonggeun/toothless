package com.mkfactory.toothless.c.eunbi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_c/eunbi/student/*")
public class EunbiStudentController {

	@Autowired
	public String writeInternSatisfactionPage(HttpSession session) {
		
		return "tl_c/eunbi/external/writeInternSatisfactionPage";
	}
}

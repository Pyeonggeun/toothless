package com.mkfactory.toothless.c.eunbi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.eunbi.service.EunbiExternalServiceImpl;

@Controller
@RequestMapping("/tl_c/eunbi/external/*")
public class EunbiExternalController {

	@Autowired
	private EunbiExternalServiceImpl externalService;
	
	@Autowired
	public String writeCompanyEvaluationPage(HttpSession session) {
		
		return "tl_c/eunbi/external/writeCompanyEvaluationPage";
	}
}

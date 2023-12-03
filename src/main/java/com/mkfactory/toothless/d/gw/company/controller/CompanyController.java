package com.mkfactory.toothless.d.gw.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_d/gw_company/*")
public class CompanyController {
	
	// 기업 등록 페이지
		@RequestMapping("registerCompanyPage")
		public String registerCompanyPage() {
			
			return "/tl_d/gw_company/registerCompanyPage";
		}

}

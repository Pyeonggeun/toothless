package com.mkfactory.toothless.d.gw.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.CompanyManagerDto;
import com.mkfactory.toothless.d.gw.company.service.CompanyServiceIpml;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;

@Controller
@RequestMapping("/tl_d/gw_company/*")
public class CompanyController {
	
	@Autowired
	private CompanyServiceIpml companyService;
	
	// 기업 등록 페이지
		@RequestMapping("registerCompanyPage")
		public String registerCompanyPage(Model model) {
			
			model.addAttribute("comScaleList",companyService.getComScaleList());
			
			return "/tl_d/gw_company/registerCompanyPage";
		}
		
		@RequestMapping("registerCompanyProcess")
		public String registerCompanyProcess(CompanyDto companyDto, CompanyManagerDto companyManagerDto, ExternalInfoDto externalInfoDto) {
			companyService.companyRegister(companyDto, companyManagerDto, externalInfoDto);
			
			System.out.println("입력완료");
			
			return"/tl_d/gw_company/registerCompanyComplete";
		}

}

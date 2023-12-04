package com.mkfactory.toothless.c.woojae.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.dto.AjdksCompanyCategoryDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.woojae.service.WoojaeExternalServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Controller
@RequestMapping("/tl_c/woojae/*")
public class WoojaeExternalController {
	
	@Autowired
	private WoojaeExternalServiceImpl woojaeExternalService;
	
	// 교직원 로그인 하면 뜨는 첫 메인페이지
	@RequestMapping("ajdksStaffMainPage")
	public String ajdksStaffMainPage() {
		
		return"tl_c/woojae/ajdksStaffMainPage";
	}
	
	// 산업체 등록 페이지
	@RequestMapping("ajdksRegisterCompanyPage")
	public String ajdksRegisterCompanyPage(HttpSession session, Model model) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto) session.getAttribute("sessionStaffInfo");
		model.addAttribute("sessionStaffInfo", sessionStaffInfo);
		
		List<AjdksCompanyCategoryDto> list = woojaeExternalService.companyCategoryList();
		model.addAttribute("list", list);
		
		return"tl_c/woojae/ajdksRegisterCompanyPage";
	}
	
	// 산업체 등록내역
	@RequestMapping("ajdksRegistedCompanyPage")
	public String ajdksRegistedCompanyPage(Model model) {
		
		List<AjdksCompanyInfoDto> list = woojaeExternalService.registedCompanyList();
		model.addAttribute("list", list);
		
		return"tl_c/woojae/ajdksRegistedCompanyPage";
	}
		
	// 산업체 등록
	@RequestMapping("registerCompanyProcess")
	public String registerCompanyProcess(AjdksCompanyInfoDto ajdksCompanyInfoDto, ExternalInfoDto externalInfoDto) {
		
		woojaeExternalService.registerCompanyInfo(ajdksCompanyInfoDto, externalInfoDto);
		
		return "redirect:./ajdksRegistedCompanyPage";
	}
}

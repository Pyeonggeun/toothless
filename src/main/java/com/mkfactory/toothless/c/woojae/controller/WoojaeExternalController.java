package com.mkfactory.toothless.c.woojae.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.taeho.service.TaehoExternalServiceImpl;
import com.mkfactory.toothless.c.woojae.service.WoojaeStaffServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;


@Controller
@RequestMapping("/tl_c/woojae/external/*")
public class WoojaeExternalController {
	
	@Autowired
	private WoojaeStaffServiceImpl woojaeStaffService;
	@Autowired
	private TaehoExternalServiceImpl taehoExternalService;	

	@RequestMapping("ajdksInternshipCourseListPage")
	public String ajdksInternshipCourseListPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();
		AjdksCompanyInfoDto ajdksCompanyInfoDto = taehoExternalService.getSessionCompanyInfoByExternalPk(externalPk);
		model.addAttribute("ajdksCompanyInfoDto", ajdksCompanyInfoDto);
		
		
		return"tl_c/woojae/external/ajdksInternshipCourseListPage";
	}
	
	
	@RequestMapping("ajdksExternalNoticePage")
	public String ajdksExternalNoticePage(HttpSession session, Model model) {
		
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();
		AjdksCompanyInfoDto ajdksCompanyInfoDto = taehoExternalService.getSessionCompanyInfoByExternalPk(externalPk);
		model.addAttribute("ajdksCompanyInfoDto", ajdksCompanyInfoDto);
		
		
		return"tl_c/woojae/external/ajdksExternalNoticePage";
	}
	
	
}

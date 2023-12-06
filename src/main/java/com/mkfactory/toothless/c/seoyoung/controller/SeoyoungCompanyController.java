package com.mkfactory.toothless.c.seoyoung.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.guntaek.service.GuntaekStudentServiceImpl;
import com.mkfactory.toothless.c.seoyoung.service.SeoyoungCompanyServicempl;
import com.mkfactory.toothless.c.woojae.service.WoojaeExternalServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;


@Controller
@RequestMapping("/tl_c/seoyoung/company/*")
public class SeoyoungCompanyController {

	@Autowired
	private SeoyoungCompanyServicempl seoyoungCompanyService;

	
	//산업체학생선발페이지
	@RequestMapping("ajdksStudentinternPage") 
	public String ajdksStudentinternPage(Model model,HttpSession session) {
	
		ExternalInfoDto sessionCompanyInfo = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		model.addAttribute("sessionCompanyInfo", sessionCompanyInfo);
		
		System.out.println(sessionCompanyInfo.getExternal_pk());
		
		
		List<Map<String, Object>> map = (List<Map<String, Object>>) seoyoungCompanyService.companyList(sessionCompanyInfo.getExternal_pk());
		model.addAttribute("list", map);
		
		
		return "tl_c/seoyoung/company/ajdksStudentinternPage";
	}
}

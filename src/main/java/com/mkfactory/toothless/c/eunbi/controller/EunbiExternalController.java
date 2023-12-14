package com.mkfactory.toothless.c.eunbi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.eunbi.service.EunbiExternalServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;

@Controller
@RequestMapping("/tl_c/eunbi/external/*")
public class EunbiExternalController {

	@Autowired
	private EunbiExternalServiceImpl externalService;
	
	@RequestMapping("viewEvaluationCourseListPage")
	public String viewEvaluationCourseListPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();
		
		model.addAttribute("companyPk", externalService.getCompanyPk(externalPk));
		
		return "tl_c/eunbi/external/viewEvaluationCourseListPage";
	}
}

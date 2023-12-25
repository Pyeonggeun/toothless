package com.mkfactory.toothless.c.eunbi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.eunbi.service.EunbiExternalServiceImpl;
import com.mkfactory.toothless.c.eunbi.service.EunbiStudentServiceImpl;
import com.mkfactory.toothless.c.taeho.service.TaehoExternalServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;

@Controller
@RequestMapping("/tl_c/eunbi/external/*")
public class EunbiExternalController {

	@Autowired
	private EunbiExternalServiceImpl externalService;
	@Autowired
	private EunbiStudentServiceImpl studentService;
	@Autowired
	private TaehoExternalServiceImpl taehoExternalService;
	
	@RequestMapping("viewEvaluationCourseListPage")
	public String viewEvaluationCourseListPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();
		
		AjdksCompanyInfoDto ajdksCompanyInfoDto = taehoExternalService.getSessionCompanyInfoByExternalPk(externalPk);
		model.addAttribute("ajdksCompanyInfoDto", ajdksCompanyInfoDto);	
		
		model.addAttribute("companyPk", externalService.getCompanyPk(externalPk));
		
		return "tl_c/eunbi/external/viewEvaluationCourseListPage";
	}
	
	@RequestMapping("viewInternTimeCard")
	public String viewInternTimeCard(HttpSession session, Model model, int student_intern_pk) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();
		
		AjdksCompanyInfoDto ajdksCompanyInfoDto = taehoExternalService.getSessionCompanyInfoByExternalPk(externalPk);
		model.addAttribute("ajdksCompanyInfoDto", ajdksCompanyInfoDto);	
		
		model.addAttribute("timecatedReport", studentService.viewTimeCard(student_intern_pk));
		model.addAttribute("internReport", studentService.getInternReport(student_intern_pk));
		model.addAttribute("countTimecard", studentService.countTimecard(student_intern_pk));
		
		return "tl_c/eunbi/external/viewInternTimeCard";
	}
	
	@RequestMapping("viewStudentDetailPage")
	public String viewStudentDetailPage(HttpSession session, Model model, int student_pk) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();
		
		AjdksCompanyInfoDto ajdksCompanyInfoDto = taehoExternalService.getSessionCompanyInfoByExternalPk(externalPk);
		model.addAttribute("ajdksCompanyInfoDto", ajdksCompanyInfoDto);	
		
		model.addAttribute("student_pk", student_pk);
		
		return "tl_c/eunbi/external/viewStudentDetailPage";
	}
	
}

package com.mkfactory.toothless.c.taeho.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyTimecardDto;
import com.mkfactory.toothless.c.taeho.service.TaehoExternalServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;

@Controller
@RequestMapping("/tl_c/taeho/external/*")
public class TaehoExternalController {

	@Autowired
	private TaehoExternalServiceImpl taehoExternalService;
	
	@RequestMapping("companyMainPage")
	public String companyMainPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();
		AjdksCompanyInfoDto ajdksCompanyInfoDto = taehoExternalService.getSessionCompanyInfoByExternalPk(externalPk);
		model.addAttribute("ajdksCompanyInfoDto", ajdksCompanyInfoDto);
		
		return "tl_c/taeho/external/companyMainPage";
	}

	@RequestMapping("courseListPageForWriteTimecard")
	public String courseListPageForWriteTimecard(HttpSession session, Model model) {

		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();

		AjdksCompanyInfoDto ajdksCompanyInfoDto = taehoExternalService.getSessionCompanyInfoByExternalPk(externalPk);
		model.addAttribute("ajdksCompanyInfoDto", ajdksCompanyInfoDto);	
		
		List<Map<String, Object>> ingInternshipCourseList = taehoExternalService.getIngInternshipCourseByExternalPk(externalPk);		
		model.addAttribute("ingInternshipCourseList", ingInternshipCourseList);
		
		return "tl_c/taeho/external/courseListPageForWriteTimecard";
		
	}
	
	@RequestMapping("writeCompanyTimecardPage")
	public String writeCompanyTimecardPage(Model model, HttpSession session, int internshipCoursePk) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();
		AjdksCompanyInfoDto ajdksCompanyInfoDto = taehoExternalService.getSessionCompanyInfoByExternalPk(externalPk);
		model.addAttribute("ajdksCompanyInfoDto", ajdksCompanyInfoDto);
		
		Map<String, Object> internshipCourseMap = taehoExternalService.getInternshipCourseInfoByInternshipCoursePk(internshipCoursePk);
		model.addAttribute("internshipCourseMap", internshipCourseMap);
		
		List<Map<String, Object>> studentInternList = taehoExternalService.getStudentInternByInternshipCoursePk(internshipCoursePk);
		model.addAttribute("studentInternList", studentInternList);
		
		return "tl_c/taeho/external/writeCompanyTimecardPage";
	}
	
	@RequestMapping("writeTimecardProcess")
	public String writeTimecardProcess(AjdksCompanyTimecardDto ajdksCompanyTimecardDto, int internshipCoursePk) {
		
		taehoExternalService.registerTimecardByStudentInternPk(ajdksCompanyTimecardDto);
		
		return "redirect:./writeCompanyTimecardPage?internshipCoursePk="+internshipCoursePk;
	}
	
	@RequestMapping("readStudentInternListPage")
	public String readStudentInternListPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();
		AjdksCompanyInfoDto ajdksCompanyInfoDto = taehoExternalService.getSessionCompanyInfoByExternalPk(externalPk);
		model.addAttribute("ajdksCompanyInfoDto", ajdksCompanyInfoDto);		
		
		List<Map<String, Object>> ingInternshipCourseList = taehoExternalService.getIngInternshipCourseByExternalPk(externalPk);		
		model.addAttribute("ingInternshipCourseList", ingInternshipCourseList);
		
		return "tl_c/taeho/external/readStudentInternListPage";
	}
	
	@RequestMapping("applyInternshipCoursePage")
	public String applyInternshipCoursePage(HttpSession session, Model model) {

		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();
		AjdksCompanyInfoDto ajdksCompanyInfoDto = taehoExternalService.getSessionCompanyInfoByExternalPk(externalPk);
		model.addAttribute("ajdksCompanyInfoDto", ajdksCompanyInfoDto);		
		
		System.out.println(externalInfoDto.getExternal_pk());

		return "tl_c/taeho/external/applyInternshipCoursePage";
	}
	
	
	
	
	
}

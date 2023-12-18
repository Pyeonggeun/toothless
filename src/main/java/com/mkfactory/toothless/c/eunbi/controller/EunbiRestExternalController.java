package com.mkfactory.toothless.c.eunbi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.c.dto.AjdksCompanyEvaluationDto;
import com.mkfactory.toothless.c.eunbi.service.EunbiExternalServiceImpl;
import com.mkfactory.toothless.c.eunbi.service.EunbiProfessorServiceImpl;
import com.mkfactory.toothless.c.eunbi.service.EunbiStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;

@RestController
@RequestMapping("/tl_c/eunbi/external/*")
public class EunbiRestExternalController {

	@Autowired
	private EunbiProfessorServiceImpl professorService;
	@Autowired
	private EunbiStudentServiceImpl studentService;
	@Autowired
	private EunbiExternalServiceImpl externalService;

	@RequestMapping("getNeedEvaluationCourseList")
	public RestResponseDto getNeedEvaluationCourseList(int company_pk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		if(externalService.getNeedEvaluationCourse(company_pk) == null) {
			restResponseDto.setData(false);
			restResponseDto.setResult("Success");
		}else {
			restResponseDto.setData(externalService.getNeedEvaluationCourse(company_pk));
			restResponseDto.setResult("Success");
		}
		
		return restResponseDto;
	}
	
	@RequestMapping("getInternshipCourseInfo")
	public RestResponseDto getInternshipCourseInfo(int internship_course_pk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(externalService.getInternshipCourseInfo(internship_course_pk));
		
		restResponseDto.setResult("Success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getStudentInternList")
	public RestResponseDto getStudentInternList(int internship_course_pk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(studentService.getStudentInternList(internship_course_pk));
		
		restResponseDto.setResult("Success");
		
		return restResponseDto;
	}
	
	@RequestMapping("writeInternEvaluation")
	public RestResponseDto writeInternEvaluation(AjdksCompanyEvaluationDto params) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		externalService.insertCompanyEvaluation(params);
		
		restResponseDto.setResult("Success");
		
		return restResponseDto;
	}
	
	
	
	
	
}

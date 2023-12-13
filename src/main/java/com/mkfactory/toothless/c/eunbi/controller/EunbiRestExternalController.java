package com.mkfactory.toothless.c.eunbi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
	
	@RequestMapping("getCompanyPk")
	public RestResponseDto getCompanyPk(HttpSession session) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();
		
		restResponseDto.setData(externalService.getCompanyPk(externalPk));
		
		restResponseDto.setResult("Success");
		
		return restResponseDto;
	}

	@RequestMapping("getNeedEvaluationCourseInfo")
	public RestResponseDto getNeedEvaluationCourseInfo(int companyPk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(externalService.getNeedEvaluationCourse(companyPk));
		
		restResponseDto.setResult("Success");
		
		return restResponseDto;
	}
	
	
	
	
}

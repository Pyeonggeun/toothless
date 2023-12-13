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

	@RequestMapping("getNeedEvaluationCourseInfo")
	public RestResponseDto getNeedEvaluationCourseInfo(int company_pk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		if(externalService.getNeedEvaluationCourse(company_pk) != null) {
			
			restResponseDto.setData(externalService.getNeedEvaluationCourse(company_pk));
		}else {
			
			restResponseDto.setData("null");
		}
		
		restResponseDto.setResult("Success");
		
		return restResponseDto;
	}
	
	
	
	
}

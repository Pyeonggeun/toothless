package com.mkfactory.toothless.c.eunbi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.c.dto.AjdksInternSatisfactionDto;
import com.mkfactory.toothless.c.eunbi.service.EunbiExternalServiceImpl;
import com.mkfactory.toothless.c.eunbi.service.EunbiProfessorServiceImpl;
import com.mkfactory.toothless.c.eunbi.service.EunbiStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@RestController
@RequestMapping("/tl_c/eunbi/student/*")
public class EunbiRestStudentController {

	@Autowired
	private EunbiProfessorServiceImpl professorService;
	@Autowired
	private EunbiStudentServiceImpl studentService;
	@Autowired
	private EunbiExternalServiceImpl externalService;
	
	@RequestMapping("getStudentPk")
	public RestResponseDto getStudentP(HttpSession session) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		StudentInfoDto sessionStudentInfo = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int sessionStudentPk = sessionStudentInfo.getStudent_pk();
		
		if(sessionStudentInfo != null) {
			restResponseDto.setData(sessionStudentPk);
		}
		
		restResponseDto.setResult("Success");
		
		return restResponseDto;
	}
	
	@RequestMapping("gradeInquiry")
	public RestResponseDto gradeInquiry(HttpSession session) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		StudentInfoDto sessionStudentInfo = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int sessionStudentPk = sessionStudentInfo.getStudent_pk();
		
		if(studentService.viewEvaluations(sessionStudentPk) != null) {
			restResponseDto.setData(studentService.viewEvaluations(sessionStudentPk));
		}else {
			restResponseDto.setData(false);
		}
		
		restResponseDto.setResult("Success");
		
		return restResponseDto;
	}
	
	@RequestMapping("writeSatisfaction")
	public RestResponseDto writeSatisfaction(HttpSession session, AjdksInternSatisfactionDto internSatisfactionDto) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		studentService.insertInternSatisfaction(internSatisfactionDto);
		
		restResponseDto.setResult("Success");
		
		return restResponseDto;
	}
	
	
}

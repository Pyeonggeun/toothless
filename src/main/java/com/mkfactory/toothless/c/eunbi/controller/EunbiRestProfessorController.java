package com.mkfactory.toothless.c.eunbi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.c.dto.AjdksProfessorEvaluationDto;
import com.mkfactory.toothless.c.eunbi.service.EunbiProfessorServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;

@RestController
@RequestMapping("/tl_c/eunbi/professor/*")
public class EunbiRestProfessorController {
	
	@Autowired
	private EunbiProfessorServiceImpl professorService;
	
	@RequestMapping("getProfessorPk")
	public RestResponseDto getProfessorPk(HttpSession session) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		ProfessorInfoDto sessionProfessorInfo = (ProfessorInfoDto)session.getAttribute("sessionProfessorInfo");
		int sessionProfessorPk = sessionProfessorInfo.getProfessor_pk();
		
		restResponseDto.setResult("Success");
		
		if(sessionProfessorInfo != null) {
			restResponseDto.setData(sessionProfessorPk);
		}
		
		return restResponseDto;
	}
	
	// 교수의 학생 평가 입력
	@RequestMapping("writeInternEvaluation")
	public RestResponseDto writeInternEvaluation(HttpSession session, AjdksProfessorEvaluationDto params) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		ProfessorInfoDto sessionProfessorInfo = (ProfessorInfoDto)session.getAttribute("sessionProfessorInfo");
		int sessionProfessorPk = sessionProfessorInfo.getProfessor_pk();
		
		params.setProfessor_pk(sessionProfessorPk);
		
		professorService.insertProfessorEvaluation(params);
		
		restResponseDto.setResult("Success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getApplyingStudentListByCourse")
	public RestResponseDto getStudentListByCourse(HttpSession session, int internship_course_pk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(professorService.getApplyingStudentList(internship_course_pk));
		
		restResponseDto.setResult("Success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getStudentInternList")
	public RestResponseDto getStudentInternList(HttpSession session, int internship_course_pk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(professorService.getStudentInternList(internship_course_pk));
		
		restResponseDto.setResult("Success");
		
		return restResponseDto;
	}
	
	public RestResponseDto isNow(int internship_course_pk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(professorService.isNow(internship_course_pk));
		
		restResponseDto.setResult("Success");
		
		return restResponseDto;
	}
	
	
	
	
	
	
	
	
	
	
	
}

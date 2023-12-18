package com.mkfactory.toothless.c.taeho.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.c.taeho.service.TaehoStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@RestController
@RequestMapping("/tl_c/taeho/student/*")
public class TaehoRestStudentController {

	@Autowired
	private TaehoStudentServiceImpl taehoStudentService;
	
	@RequestMapping("getInternReportList")
	public RestResponseDto getInternReportList(HttpSession session) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		restResponseDto.setResult("success");
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int studentPk = studentInfoDto.getStudent_pk();
		
		restResponseDto.setData(taehoStudentService.getIngInternReportByStudentPk(studentPk));
		
		return restResponseDto;
	}
	
	
	
	
	
	
	
	
	
	
}

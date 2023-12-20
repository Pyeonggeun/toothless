package com.mkfactory.toothless.a.student.dm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.a.student.dm.service.DormStudentServiceDm;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;

@RestController
@RequestMapping("/tl_a/student/*")
public class RestDormStudentControllerDm {
	
	@Autowired
	public DormStudentServiceDm dormStudentServiceDm;
	
	@RequestMapping("studentList")
	public RestResponseDto studentList(){
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.studentListAll());
		
		return responseDto;
	}
	
	@RequestMapping("studentInfoPk")
	public RestResponseDto studentInfoPk(int student_pk) {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.studentInfoByStudentPk(student_pk));
		
		return responseDto;
		
		
	}
	
	
	
	
	
	
}

package com.mkfactory.toothless.donot.touch.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.donot.touch.service.StudentServiceImpl;

@RestController
@RequestMapping("/another/student/*")
public class RestStudentController {
	@Autowired
	private StudentServiceImpl studentService;
	
	@RequestMapping("getStudentInfoList")
	public RestResponseDto getStudentInfoList() {
		RestResponseDto responseDto = new RestResponseDto();
		
		List<Map<String, Object>> studentInfoList = studentService.getStudentList();
		
		responseDto.setResult("success");
		responseDto.setData(studentInfoList);
		
		return responseDto;
		
	}
	
}

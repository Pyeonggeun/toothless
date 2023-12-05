package com.mkfactory.toothless.donot.touch.controller;

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
	
	public RestResponseDto reloadMyNotifyCount(int student_pk) {
		RestResponseDto responseDto = new RestResponseDto();
		int notifyCount = studentService.reloadMyNotifyCount(student_pk);
		
		responseDto.setData(notifyCount);
		responseDto.setResult("success");
		
		return responseDto;
		
	}
}

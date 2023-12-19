package com.mkfactory.toothless.e.groupcounsel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.e.dto.RestResponseGroupCounselDto;
import com.mkfactory.toothless.e.groupcounsel.service.CounselCommonsStudentServiceImpl;

@RestController
@RequestMapping("/tl_e/commons/*")
public class RestCommonsStudentController {

	@Autowired
	CounselCommonsStudentServiceImpl counselCommonsStudentService;
	
	
	@RequestMapping("getGroupCounselList")
	public RestResponseGroupCounselDto getGroupCounselList(int student_id) {
		RestResponseGroupCounselDto restResponseGroupCounselDto = new RestResponseGroupCounselDto(); 
		
		
		
		restResponseGroupCounselDto.setData(counselCommonsStudentService.getGroupCounselList(student_id));
		restResponseGroupCounselDto.setResult("success");
		return restResponseGroupCounselDto;
	}
	
	
	
	public RestResponseGroupCounselDto templete() {
		RestResponseGroupCounselDto restResponseGroupCounselDto = new RestResponseGroupCounselDto();
		
		
		
		restResponseGroupCounselDto.setResult("success");
		
		return restResponseGroupCounselDto;
	}
	
	
	
	
	
	
}

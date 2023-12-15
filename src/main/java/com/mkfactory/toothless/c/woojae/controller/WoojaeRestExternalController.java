package com.mkfactory.toothless.c.woojae.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.c.woojae.service.WoojaeStaffServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;

@RestController
@RequestMapping("/tl_c/woojae/external/*")
public class WoojaeRestExternalController {
	
	@Autowired
	private WoojaeStaffServiceImpl woojaeStaffService;
	
	@RequestMapping("internshipCourseList")
	public RestResponseDto internshipCourseList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(woojaeStaffService.internshipCourseList());
		
		return restResponseDto;
	}
}

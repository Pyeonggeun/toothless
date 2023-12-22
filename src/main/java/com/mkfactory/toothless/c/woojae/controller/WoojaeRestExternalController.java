package com.mkfactory.toothless.c.woojae.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.c.woojae.service.WoojaeStaffServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;

@RestController
@RequestMapping("/tl_c/woojae/external/*")
public class WoojaeRestExternalController {
	
	@Autowired
	private WoojaeStaffServiceImpl woojaeStaffService;
	
	@RequestMapping("internshipCourseList")
	public RestResponseDto internshipCourseList(int company_pk) {
		
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(woojaeStaffService.internshipCourseList(company_pk));
		
		return restResponseDto;
	}
	
	@RequestMapping("internshipCourseListByExternalPk")
	public RestResponseDto internshipCourseListByExternalPk(HttpSession session) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto) session.getAttribute("sessionExternalInfo");
		int external_pk = externalInfoDto.getExternal_pk();
		
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(woojaeStaffService.internshipCourseListByExternalPk(external_pk));
		
		return restResponseDto;
	}
	
}

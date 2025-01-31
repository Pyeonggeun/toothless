package com.mkfactory.toothless.c.taeho.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.c.taeho.service.TaehoExternalServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;

@RestController
@RequestMapping("/tl_c/taeho/external/*")
public class TaehoRestExternalController {

	@Autowired
	private TaehoExternalServiceImpl taehoExternalService;
	
	
	@RequestMapping("getInternListByInternshipCoursePk")
	public RestResponseDto getInternListByInternshipCoursePk(int internshipCoursePk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		
		System.out.println("컨트롤러:" + internshipCoursePk);
		
		restResponseDto.setData(taehoExternalService.getInternListByInternshipCoursePk(internshipCoursePk));
		
		return restResponseDto;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}

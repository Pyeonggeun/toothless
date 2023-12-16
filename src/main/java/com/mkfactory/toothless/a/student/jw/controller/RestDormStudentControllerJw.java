package com.mkfactory.toothless.a.student.jw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.mkfactory.toothless.a.student.jw.service.DormStudentServiceJw;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;

@RestController
@RequestMapping("/tl_a/student/*")
public class RestDormStudentControllerJw {
	
	@Autowired
	public DormStudentServiceJw dormStudentServiceJw;
	
	@RequestMapping("threeList")
	public RestResponseDto threeList() {
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
	
		restResponseDto.setData(dormStudentServiceJw.resentBoardthree());
		restResponseDto.setResult("success");
		
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)		
	}
	
}

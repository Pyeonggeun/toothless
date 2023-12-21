package com.mkfactory.toothless.b.hn.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.b.dto.B_RestResponseDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@RestController
@RequestMapping("/tl_b/common/*")
public class RestHealthRoomCommonController {
	
	@RequestMapping("getStaffName")
	public B_RestResponseDto getStaffName(HttpSession session) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		restResponseDto.setData(staffInfoDto.getName());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getStudentName")
	public B_RestResponseDto getStudentName(HttpSession session) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		restResponseDto.setData(studentInfoDto.getName());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}

}

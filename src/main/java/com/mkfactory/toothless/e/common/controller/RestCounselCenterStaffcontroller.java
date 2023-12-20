package com.mkfactory.toothless.e.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.e.dto.JinyongRestResponseDto;

@RestController
@RequestMapping("/tl_e/commons/*")
public class RestCounselCenterStaffcontroller {

	
	@RequestMapping("getSessionStaffInfo")
	public JinyongRestResponseDto getSessionStaffInfo(HttpSession session) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(sessionStaffInfo);
		
		return jinyongRestResponseDto;
		
	}
	
	public JinyongRestResponseDto templete() {
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		
		return jinyongRestResponseDto;
		
	}
}

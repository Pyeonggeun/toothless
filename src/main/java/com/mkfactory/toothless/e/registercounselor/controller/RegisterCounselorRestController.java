package com.mkfactory.toothless.e.registercounselor.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.e.dto.JinyongRestResponseDto;
import com.mkfactory.toothless.e.registercounselor.service.RegisterCounselorServiceImpl;

@RestController
@RequestMapping("/tl_e/registerCounselor")
public class RegisterCounselorRestController {
	
	@Autowired
	RegisterCounselorServiceImpl registerCounselorService; 
	
	@RequestMapping("restGetStaffInfo")
	public JinyongRestResponseDto restGetStaffInfo(HttpSession session) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
		
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(sessionStaffInfo);
		
		return jinyongRestResponseDto;
		
	}
	
	@RequestMapping("restGetCounselorInfo")
	public JinyongRestResponseDto restGetCounselorInfo() {
		
		List<Map<String, Object>> counselorList = registerCounselorService.getAllCounselorList();
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
		
		jinyongRestResponseDto.setData(counselorList);
		jinyongRestResponseDto.setResult("success");
		
		return jinyongRestResponseDto;
		
	}
	
	
	public JinyongRestResponseDto templete() {
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		
		return jinyongRestResponseDto;
		
	}
}

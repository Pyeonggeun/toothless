package com.mkfactory.toothless.e.common.controller;

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
@RequestMapping("/tl_e/commons/*")
public class RestCounselCenterStaffcontroller {

	@Autowired
	RegisterCounselorServiceImpl registerCounselorService;
	
	
	@RequestMapping("getSessionStaffInfo")
	public JinyongRestResponseDto getSessionStaffInfo(HttpSession session) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(sessionStaffInfo);
		
		return jinyongRestResponseDto;		
	}
	
	@RequestMapping("getAllCompleteCounselList")	
	public JinyongRestResponseDto getAllCompleteCounselList() {
		
		List<Map<String, Object>> allCompleteCounselList = registerCounselorService.getAllCompleteCounselList();
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(allCompleteCounselList);
		
		return jinyongRestResponseDto;
		
	}
	
	@RequestMapping("getCompleteCounselData")
	public JinyongRestResponseDto getCompleteCounselData() {
		
		Map<String, Object> completeCounselCountValue = 
				registerCounselorService.getAllTypeCompleteCounselCountValue();
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(completeCounselCountValue);
		
		return jinyongRestResponseDto;		
	}
	
	@RequestMapping("getGroupCounselListForStaffMain")
	public JinyongRestResponseDto getGroupCounselListForStaffMain() {
		
		List<Map<String, Object>> groupCounselList = registerCounselorService.getGroupCounselList();
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(groupCounselList);
		
		return jinyongRestResponseDto;		
	}
	
	@RequestMapping("getNoticeListForStaffMain")
	public JinyongRestResponseDto getNoticeListForStaffMain() {
		
		List<Map<String, Object>> noticeList = registerCounselorService.getNoticeListForStaffMain();
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(noticeList);
		
		return jinyongRestResponseDto;		
	}
	
	@RequestMapping("getFreeboardForStaffMain")
	public JinyongRestResponseDto getFreeboardForStaffMain() {
		
		List<Map<String, Object>> freeboardList = registerCounselorService.getFreeboardForStaffMain();
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(freeboardList);
		
		return jinyongRestResponseDto;
		
	} 
	
	
	
	
	public JinyongRestResponseDto templete() {
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		
		return jinyongRestResponseDto;
		
	}
}

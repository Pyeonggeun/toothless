package com.mkfactory.toothless.e.groupcounsel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.e.dto.GroupCounselCounselorDto;
import com.mkfactory.toothless.e.dto.GroupCounselReservationDto;
import com.mkfactory.toothless.e.dto.RestResponseGroupCounselDto;
import com.mkfactory.toothless.e.groupcounsel.service.GroupCounselStaffServiceImpl;
import com.mkfactory.toothless.e.groupcounsel.service.GroupCounselStudentServiceImpl;

@RestController
@RequestMapping("/tl_e/groupcounsel/staff/*")
public class RestGroupCounselStaffController {

	@Autowired
	GroupCounselStudentServiceImpl groupCounselStudentService;
	@Autowired
	GroupCounselStaffServiceImpl groupCounselStaffService;
	
	@RequestMapping("getStudentListByGroupCounselId")
	public RestResponseGroupCounselDto getStudentListByGroupCounselId(int group_counsel_id) {
		RestResponseGroupCounselDto restResponseGroupCounselDto = new RestResponseGroupCounselDto();
		
		restResponseGroupCounselDto.setData(groupCounselStaffService.readGroupCounselDetail(group_counsel_id));
		
		restResponseGroupCounselDto.setResult("success");
		
		return restResponseGroupCounselDto;
	}
	
	
	@RequestMapping("toggleAttendanceCheck")
	public RestResponseGroupCounselDto toggleAttendanceCheck(int group_reservation_id) {
		RestResponseGroupCounselDto restResponseGroupCounselDto = new RestResponseGroupCounselDto();
		
		groupCounselStaffService.studentIsAttendCheck(group_reservation_id);
		
		restResponseGroupCounselDto.setResult("success");	
		
		return restResponseGroupCounselDto;
	}
	
	@RequestMapping("getCounselorListByGroupCounselId")
	public RestResponseGroupCounselDto getCounselorListByGroupCounselId(int group_counsel_id) {
		RestResponseGroupCounselDto restResponseGroupCounselDto = new RestResponseGroupCounselDto();
		
		restResponseGroupCounselDto.setData(groupCounselStaffService.readGroupCounselDetail(group_counsel_id));
		
		restResponseGroupCounselDto.setResult("success");
		
		return restResponseGroupCounselDto;
	}
	
	@RequestMapping("getCounselorList")
	public RestResponseGroupCounselDto getCounselorList() {
		RestResponseGroupCounselDto restResponseGroupCounselDto = new RestResponseGroupCounselDto();
		
		restResponseGroupCounselDto.setData(groupCounselStaffService.readGrouopCounselCounselorList());
		
		restResponseGroupCounselDto.setResult("success");
		
		return restResponseGroupCounselDto;
	}		

	@RequestMapping("registerCounselor")
	public RestResponseGroupCounselDto registerCounselor(GroupCounselCounselorDto params) {
		RestResponseGroupCounselDto restResponseGroupCounselDto = new RestResponseGroupCounselDto();
		
		groupCounselStaffService.insertGroupCounselCounselor(params);
		
		restResponseGroupCounselDto.setResult("success");
		
		return restResponseGroupCounselDto;
	}	
	
	
	
	public RestResponseGroupCounselDto templete() {
		RestResponseGroupCounselDto restResponseGroupCounselDto = new RestResponseGroupCounselDto();
		
		
		
		restResponseGroupCounselDto.setResult("success");
		
		return restResponseGroupCounselDto;
	}
	
	
	
}

package com.mkfactory.toothless.b.hn.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.b.dto.B_RestResponseDto;
import com.mkfactory.toothless.b.hn.common.service.HealthRoomCommonServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@RestController
@RequestMapping("/tl_b/common/*")
public class RestHealthRoomCommonController {
	
	@Autowired
	private HealthRoomCommonServiceImpl healthRoomCommonService;
	
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
	
	@RequestMapping("getItemList")
	public B_RestResponseDto getItemList() {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(healthRoomCommonService.getItemList());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getEduList")
	public B_RestResponseDto getEduList() {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(healthRoomCommonService.getEduList());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}

	@RequestMapping("getStudentboardList")
	public B_RestResponseDto getStudentboardList() {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(healthRoomCommonService.getStudentboardList());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getStaffboardList")
	public B_RestResponseDto getStaffboardList() {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(healthRoomCommonService.getStaffboardList());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getMedicineCount")
	public B_RestResponseDto getMedicineCount() {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(healthRoomCommonService.getMedicineCount());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getUserCountList")
	public B_RestResponseDto getUserCountList() {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(healthRoomCommonService.getUserCountList());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}

}

package com.mkfactory.toothless.a.staff.dm.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.a.staff.dm.service.DormStaffServiceDm;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;

@RestController
@RequestMapping("/tl_a/staff/*")
public class RestDormStaffControllerDm {
	
	@Autowired
	public DormStaffServiceDm dormStaffServiceDm;
	
	//호실정보에 동정보까지 엮어서 가져온 리스트
	@RequestMapping("dongHoList")
	public RestResponseDto dongHoList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormStaffServiceDm.dormRoomAllList());
		
		return restResponseDto;
	}
	
	
	
	
}

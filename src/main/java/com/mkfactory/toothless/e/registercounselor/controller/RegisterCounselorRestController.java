package com.mkfactory.toothless.e.registercounselor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.e.dto.JinyongRestResponseDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;
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
	public JinyongRestResponseDto restGetCounselorInfo(@RequestParam Map<String, Object> formData) {
		
		System.out.println("searchCounselorName : " + formData.get("searchCounselorName"));
		System.out.println("searchCounselorType : " + formData.get("searchCounselorType"));	
		System.out.println("searchGenderOption : " + formData.get("searchGenderOption"));
		System.out.println("searchScoreOption : " + formData.get("searchScoreOption"));
		
		List<Map<String, Object>> counselorList = registerCounselorService.getCounselorListForAJAX(formData);
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
		
		for(Map<String, Object> map :counselorList) {
			System.out.println(map.get("NAME"));
		}
		
		jinyongRestResponseDto.setData(counselorList);
		jinyongRestResponseDto.setResult("success");
		
		return jinyongRestResponseDto;
		
	}
	
	@RequestMapping("reloadSearchTypeCategory")
	public JinyongRestResponseDto reloadSearchTypeCategory() {
		
		List<TypeCategoryDto> categoryList = registerCounselorService.getAllTypeCategoryList();
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(categoryList);
		
		return jinyongRestResponseDto;
		
	}
	
	public JinyongRestResponseDto templete() {
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		
		return jinyongRestResponseDto;
		
	}
}

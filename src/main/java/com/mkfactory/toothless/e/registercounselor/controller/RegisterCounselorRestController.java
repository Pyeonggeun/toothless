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
	public JinyongRestResponseDto restGetCounselorInfo(
			@RequestParam(name="searchCounselorName" ,defaultValue="default") String searchCounselorName,
			@RequestParam(name="searchCounselorType",defaultValue="0") int searchCounselorType,
			@RequestParam(name="searchGenderOption", defaultValue="default") String searchGenderOption,
			@RequestParam(name="searchScoreOption",defaultValue="default") String searchScoreOption			
			) {
		System.out.println("[ RegisterCounselorRestController] => [ restGetCounselorInfo ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		if(searchGenderOption.equals("undefined")) {
			searchGenderOption = "default";
		}else if(searchGenderOption.equals("male")) {
			searchGenderOption = "M";
		}else if(searchGenderOption.equals("female")) {
			searchGenderOption = "F";
		}else if(searchGenderOption.equals("all")) {
			searchGenderOption = "default";
		}
		
		System.out.println("searchCounselorName : " + searchCounselorName);
		System.out.println("searchCounselorType : " + searchCounselorType);	
		System.out.println("searchGenderOption : " + searchGenderOption);
		System.out.println("searchScoreOption : " + searchScoreOption);
		
		List<Map<String, Object>> counselorList = 
				registerCounselorService.getCounselorListForAJAX(
						searchCounselorName,searchCounselorType,searchGenderOption,searchScoreOption
						);
		
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

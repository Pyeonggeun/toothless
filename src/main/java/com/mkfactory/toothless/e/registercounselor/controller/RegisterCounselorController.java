package com.mkfactory.toothless.e.registercounselor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.registercounselor.service.RegisterCounselorServiceImpl;

@Controller
@RequestMapping("/tl_e/registerCounselor")
public class RegisterCounselorController {
	
	@Autowired
	RegisterCounselorServiceImpl registerCounselorService;
	
	@RequestMapping("registerPage")
	public String registerPage() {
		System.out.println("[ RegisterCounselorController] => [ registerPage ] 실행됨");
		System.out.println("---------------------------------------------------------");
		return "./tl_e/registerCounselor/registerPage";
	}
	
	@RequestMapping("registerProcess")
	public String registerProcess(ExternalInfoDto externalInfoDto, CounselorDto counselorDto ) {
		System.out.println("[ RegisterCounselorController] => [ registerProcess ] 실행됨");
		System.out.println("---------------------------------------------------------");
			
		System.out.println(externalInfoDto.getExternal_id());
		System.out.println(externalInfoDto.getPassword());
		System.out.println(externalInfoDto.getExternal_category());
		
		System.out.println(counselorDto.getName());
		System.out.println(counselorDto.getAge());
		System.out.println(counselorDto.getGender());
		System.out.println(counselorDto.getPhonenumber());
		System.out.println(counselorDto.getEmail());
		System.out.println(counselorDto.getAddress());			
		System.out.println(counselorDto.getCareer());
		System.out.println(counselorDto.getProfileImage());
		
		registerCounselorService.registerCounselor(externalInfoDto, counselorDto);
		
		return "./tl_e/registerCounselor/registerSuccess";
	}
}

package com.mkfactory.toothless.c.woojae.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.woojae.service.WoojaeExternalServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@RestController
@RequestMapping("/tl_c/woojae/staff/*")
public class RestExternalController {
	
	@Autowired
	private WoojaeExternalServiceImpl woojaeExternalService;
	
	// 사업자등록번호 확인
	@RequestMapping("existCompanyId")
	public RestResponseDto existCompanyId(String company_id) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		restResponseDto.setResult("success");
		restResponseDto.setData(woojaeExternalService.existCompanyId(company_id));
		
		return restResponseDto;
	}
	
	// 산업체 아이디 확인
	@RequestMapping("existByExternalId")
	public RestResponseDto existByExternalId(String external_id) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		restResponseDto.setResult("success");
		restResponseDto.setData(woojaeExternalService.existByExternalId(external_id));
		
		return restResponseDto;
	}
	
	// 업종 카테고리 리스트(산업체 등록)
	@RequestMapping("companyCategoryList")
	public RestResponseDto companyCategoryList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(woojaeExternalService.companyCategoryList());
		
		return restResponseDto;
	}

	// 산업체 등록
	@RequestMapping("registerCompany")
	public RestResponseDto registerCompany(HttpSession session, AjdksCompanyInfoDto ajdksCompanyInfoDto, ExternalInfoDto externalInfoDto) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		int staffPk = staffInfoDto.getStaff_pk();
		ajdksCompanyInfoDto.setStaff_pk(staffPk);
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
		
	}
	
	@RequestMapping("templete")
	public RestResponseDto templete() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
		
	}
}

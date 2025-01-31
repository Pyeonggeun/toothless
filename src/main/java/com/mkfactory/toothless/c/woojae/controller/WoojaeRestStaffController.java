package com.mkfactory.toothless.c.woojae.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.woojae.service.WoojaeStaffServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@RestController
@RequestMapping("/tl_c/woojae/staff/*")
public class WoojaeRestStaffController {
	
	@Autowired
	private WoojaeStaffServiceImpl woojaeStaffService;
	
	// 사업자등록번호 확인
	@RequestMapping("existCompanyId")
	public RestResponseDto existCompanyId(String company_id) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		restResponseDto.setResult("success");
		restResponseDto.setData(woojaeStaffService.existCompanyId(company_id));
		
		return restResponseDto;
	}
	
	// 산업체 아이디 확인
	@RequestMapping("existByExternalId")
	public RestResponseDto existByExternalId(String external_id) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		restResponseDto.setResult("success");
		restResponseDto.setData(woojaeStaffService.existByExternalId(external_id));
		
		return restResponseDto;
	}
	
	// 업종 카테고리 리스트
	@RequestMapping("companyCategoryList")
	public RestResponseDto companyCategoryList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		restResponseDto.setData(woojaeStaffService.companyCategoryList());
	
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}

	// 산업체 등록
	@RequestMapping("registerCompany")
	public RestResponseDto registerCompany(HttpSession session, AjdksCompanyInfoDto ajdksCompanyInfoDto, ExternalInfoDto externalInfoDto) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		int staffPk = sessionStaffInfo.getStaff_pk();
		ajdksCompanyInfoDto.setStaff_pk(staffPk);
		
		woojaeStaffService.registerCompanyInfo(ajdksCompanyInfoDto, externalInfoDto);
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
		
	}
	
	// 교직원 아이디 주기
	@RequestMapping("getStaffId")
	public RestResponseDto getStaffId(HttpSession session) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		restResponseDto.setResult("success");
		
		if(sessionStaffInfo != null) {
			restResponseDto.setData(sessionStaffInfo.getStaff_pk());
		}
		
		return restResponseDto;
		
	}
	
	// 카테고리별 등록된 산업체 전체 리스트
	@RequestMapping("getCompanyListByCategoryPk")
	public RestResponseDto getCompanyListByCategoryPk(int company_category_pk) {
		
		
		RestResponseDto restResponseDto = new RestResponseDto();
		if(company_category_pk == 0) {
			
			restResponseDto.setData(woojaeStaffService.registedCompanyList());
			restResponseDto.setResult("success");
			
			return restResponseDto;
		}else {
			restResponseDto.setResult("success");
			restResponseDto.setData(woojaeStaffService.getCompanyListByCategoryPk(company_category_pk));
			
			return restResponseDto;
		}
		
	}

	// 전체 산업체 리스트
	@RequestMapping("registedCompanyList")
	public RestResponseDto registedCompanyList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		restResponseDto.setData(woojaeStaffService.registedCompanyList());
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
		
	}
	
	
	// 카테고리 검색 리스트
	@RequestMapping("categorizedCompanyList")
	public RestResponseDto categorizedCompanyList(
			@RequestParam(name = "searchType", required = false) int[] searchType, 
			@RequestParam(name = "searchWord", defaultValue = "default") String searchWord ){
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(woojaeStaffService.categorizedCompanyList(searchType, searchWord));
		
		return restResponseDto;
		
	}

	
	
	// 템플릿
	@RequestMapping("templete")
	public RestResponseDto templete() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
		
	}
}

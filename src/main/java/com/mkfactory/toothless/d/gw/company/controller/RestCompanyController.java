package com.mkfactory.toothless.d.gw.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.D_RestResponseDto;
import com.mkfactory.toothless.d.gw.company.service.CompanyServiceIpml;

@RestController
@RequestMapping("/tl_d/gw_company/*")
public class RestCompanyController {
	
	@Autowired
	private CompanyServiceIpml companyService;

	@RequestMapping("existByBusinessNumber")
	public D_RestResponseDto existByBusinessNumber(String business_number) {
		
		D_RestResponseDto d_RestResponseDto=new D_RestResponseDto();
		
		d_RestResponseDto.setResult("success");
		d_RestResponseDto.setData(companyService.existBusinessNumber(business_number));
		
		return d_RestResponseDto;
	}
	
	@RequestMapping("existByExternalId")
	public D_RestResponseDto existByExternalId(String external_id) {
		
		D_RestResponseDto d_RestResponseDto=new D_RestResponseDto();
		
		d_RestResponseDto.setResult("success");
		d_RestResponseDto.setData(companyService.existExternalId(external_id));
		
		return d_RestResponseDto;
	}
	
	@RequestMapping("getCompanyList")
	public D_RestResponseDto getCompanyList() {
		
		D_RestResponseDto d_RestResponseDto=new D_RestResponseDto();
		
		
		
		d_RestResponseDto.setResult("success");
		d_RestResponseDto.setData(companyService.getCompanyList());
		
		System.out.println(d_RestResponseDto.getData());
		
		return d_RestResponseDto;
	}
	
}

package com.mkfactory.toothless.c.woojae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCompanyCategoryDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.woojae.mapper.WoojaeExternalSqlMapper;


@Service
public class WoojaeExternalServiceImpl {
	
	@Autowired
	private WoojaeExternalSqlMapper woojaeExternalSqlMapper;
	// 업종 카테고리 리스트
	public List<AjdksCompanyCategoryDto> companyCategoryList(){
		
		List<AjdksCompanyCategoryDto> companyCategoryList = woojaeExternalSqlMapper.selectCompanyCategoryList();
		
		return companyCategoryList;
	}
	// 산업체 등록
	public void registerCompanyInfo(AjdksCompanyInfoDto ajdksCompanyInfoDto) {
		
		woojaeExternalSqlMapper.insertCompanyInfo(ajdksCompanyInfoDto);
	}
	
	// 등록된 산업체 리스트
	public List<AjdksCompanyInfoDto> registedCompanyList(){
		
		return woojaeExternalSqlMapper.selectRegisteredCompanyList();
	}
}

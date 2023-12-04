package com.mkfactory.toothless.c.woojae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCompanyCategoryDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.woojae.mapper.WoojaeExternalSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;


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
	public void registerCompanyInfo(AjdksCompanyInfoDto ajdksCompanyInfoDto, ExternalInfoDto externalInfoDto) {
		
		// 외부사용자 Pk
		int externalPk = woojaeExternalSqlMapper.createExternalPk();
		ajdksCompanyInfoDto.setExternal_pk(externalPk); // 산업체 등록할 때, 외부사용자pk 외래키 지정
		externalInfoDto.setExternal_pk(externalPk); // 외부사용자 pk지정
		
		// 산업체 등록
		woojaeExternalSqlMapper.insertCompanyInfo(ajdksCompanyInfoDto);
		// 외부사용자 등록
		woojaeExternalSqlMapper.insertExternalInfo(externalInfoDto);
	}
	
	// 등록된 산업체 리스트
	public List<AjdksCompanyInfoDto> registedCompanyList(){
		
		return woojaeExternalSqlMapper.selectRegisteredCompanyList();
	}
}

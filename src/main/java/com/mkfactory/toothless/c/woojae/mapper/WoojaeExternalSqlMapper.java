package com.mkfactory.toothless.c.woojae.mapper;

import java.util.List;

import com.mkfactory.toothless.c.dto.AjdksCompanyCategoryDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;

public interface WoojaeExternalSqlMapper {
	
	// 업종 카테고리
	public List<AjdksCompanyCategoryDto> selectCompanyCategoryList();
	// 산업체 등록
	public void insertCompanyInfo(AjdksCompanyInfoDto ajdksCompanyInfoDto);
	// 등록된 산업체 리스트
	public List<AjdksCompanyInfoDto> selectRegisteredCompanyList();
}

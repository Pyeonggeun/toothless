package com.mkfactory.toothless.c.woojae.mapper;

import java.util.List;

import com.mkfactory.toothless.c.dto.AjdksCompanyCategoryDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;

public interface WoojaeExternalSqlMapper {
	
	// 외부사용자 PK
	public int createExternalPk();
	
	// 업종 카테고리
	public List<AjdksCompanyCategoryDto> selectCompanyCategoryList();
	
	// 산업체 등록
	public void insertCompanyInfo(AjdksCompanyInfoDto ajdksCompanyInfoDto);
	
	// 외부사용자 등록
	public void insertExternalInfo(ExternalInfoDto externalInfoDto);
	
	// 등록된 산업체 리스트
	public List<AjdksCompanyInfoDto> selectRegisteredCompanyList();
	public AjdksCompanyCategoryDto selectBycompany_category_pk(int company_category_pk);
	
	//카테고리별 산업체 리스트
	public List<AjdksCompanyInfoDto> selectCompanyListByCategoryPk(int company_category_pk);
}

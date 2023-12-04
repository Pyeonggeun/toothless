package com.mkfactory.toothless.d.gw.company.mapper;

import java.util.List;

import com.mkfactory.toothless.d.dto.ComScaleCategoryDto;
import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.CompanyManagerDto;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;

public interface CompanySqlMapper {

	public void insertCompany(CompanyDto companyDto);
	
	public void insertCompanyManager(CompanyManagerDto companyManagerDto);
	
	public int creatCompanyManagerPK();
	
	public List<ComScaleCategoryDto> selectComScaleCategoryAll();
	
	public int creatExternalPK(); 
	
	public void insertCompanyExternal(ExternalInfoDto externalInfoDto);
}

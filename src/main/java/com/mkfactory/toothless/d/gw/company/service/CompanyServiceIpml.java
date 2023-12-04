package com.mkfactory.toothless.d.gw.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.ComScaleCategoryDto;
import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.CompanyManagerDto;
import com.mkfactory.toothless.d.gw.company.mapper.CompanySqlMapper;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;

@Service
public class CompanyServiceIpml {
	
	@Autowired
	private CompanySqlMapper companySqlMapper;
	
	public void companyRegister(CompanyDto companyDto, CompanyManagerDto companyManagerDto, ExternalInfoDto externalInfoDto) {
		
		int externalPk=companySqlMapper.creatExternalPK();
		int comManagerPk=companySqlMapper.creatCompanyManagerPK();
		
		externalInfoDto.setExternal_pk(externalPk);
		companyManagerDto.setExternal_pk(externalPk);
		companyManagerDto.setCom_manager_pk(comManagerPk);
		companyDto.setCom_manager_pk(comManagerPk);
		
		companySqlMapper.insertCompanyExternal(externalInfoDto);
		
		companySqlMapper.insertCompanyManager(companyManagerDto);
		
		
		companySqlMapper.insertCompany(companyDto);
		
	}
	
	public List<ComScaleCategoryDto> getComScaleList(){
		return companySqlMapper.selectComScaleCategoryAll();
	}
}

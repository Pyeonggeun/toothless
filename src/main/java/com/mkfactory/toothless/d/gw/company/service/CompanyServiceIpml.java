package com.mkfactory.toothless.d.gw.company.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public Map<String, Object> getCompany(int companyPK, int companyManagerPK){
		
		Map<String, Object> companyMap=new HashMap<>();
		
		CompanyDto companyDto=companySqlMapper.companySelectById(companyPK);
		CompanyManagerDto companyManagerDto=companySqlMapper.companyManagerSelectById(companyManagerPK);
		
		companyMap.put("companyDto", companyDto);
		companyMap.put("companyManagerDto", companyManagerDto);
		
		return companyMap;
	}
	
	public List<Map<String, Object>> getCompanyList(){
		
		List<Map<String, Object>> companyList=new ArrayList<>();
		
		List<CompanyDto> companyDtoList=companySqlMapper.selectCompanyAll();
		
		for(CompanyDto companyDto:companyDtoList) {
			CompanyManagerDto companyManagerDto=companySqlMapper.companyManagerSelectById(companyDto.getCom_manager_pk());
			
			Map<String, Object> map=new HashMap<>();
			map.put("companyDto", companyDto);
			map.put("companyManagerDto", companyManagerDto);
			
			companyList.add(map);
		}
		
		return companyList;
	}
}

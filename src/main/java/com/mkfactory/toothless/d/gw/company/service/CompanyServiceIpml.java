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
import com.mkfactory.toothless.d.dto.InterestCompanyDto;
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
	
	public Map<String, Object> getCompany(int com_pk){
		
		Map<String, Object> companyMap=new HashMap<>();
		
		CompanyDto companyDto=companySqlMapper.companySelectById(com_pk);
		CompanyManagerDto companyManagerDto=companySqlMapper.companyManagerSelectById(companyDto.getCom_manager_pk());
		ComScaleCategoryDto comScaleCategoryDto=companySqlMapper.comScaleCategorySelectById(companyDto.getCom_scale_category_pk());
		
		companyMap.put("companyDto", companyDto);
		companyMap.put("companyManagerDto", companyManagerDto);
		companyMap.put("comScaleCategoryDto", comScaleCategoryDto);
		companyMap.put("interestCompany", companySqlMapper.companyInterestCount(companyDto.getCom_pk()));
		
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
	
	//가족기업으로 변환
	public void changeFamilyCompany(int companyPK) {
		companySqlMapper.changeFamilyCompany(companyPK);
	}
	
	//가족기업 일반기업으로 변환
	public void changeGeneralCompany(int companyPK) {
		companySqlMapper.changeGeneralCompany(companyPK);
	}
	
	//기업정보 수정
	
	public void updateCompanyInfo(CompanyDto companyDto, CompanyManagerDto companyManagerDto) {
		companySqlMapper.updateCompany(companyDto);
		companySqlMapper.updateCompanyManager(companyManagerDto);
	}
	
	//기업정보 삭제
	public void deleteCompanyInfo(int com_pk, int com_manager_pk, int external_pk) {
		companySqlMapper.deleteCompany(com_pk);
		companySqlMapper.deleteCompanyManager(com_manager_pk);
		companySqlMapper.deleteExternal(external_pk);
	}
	
	//기업 찜하기
	public void insertInterestCompany(InterestCompanyDto interestCompanyDto) {
		companySqlMapper.insertInterestCompany(interestCompanyDto);
	}
	
	//기업 찜 취소
	public void deleteInterestCompany(InterestCompanyDto interestCompanyDto) {
		companySqlMapper.deleteInterestCompany(interestCompanyDto);
	}
	
	//내가 기업 좋아요 했나 카운트
	public int studentInterestCompany(InterestCompanyDto interestCompanyDto) {
		return companySqlMapper.studentInterestCount(interestCompanyDto);
	}
	
	//기업 총합 좋아요
	public int companyTotalInterest(int com_pk) {
		return companySqlMapper.companyInterestCount(com_pk);
	}
}

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
import com.mkfactory.toothless.d.dto.ResumeDto;
import com.mkfactory.toothless.d.gw.company.mapper.CompanySqlMapper;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.GraduationInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

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
		
		CompanyDto companyDto=companySqlMapper.companySelectByPk(com_pk);
		CompanyManagerDto companyManagerDto=companySqlMapper.companyManagerSelectByPk(companyDto.getCom_manager_pk());
		ComScaleCategoryDto comScaleCategoryDto=companySqlMapper.comScaleCategorySelectByPk(companyDto.getCom_scale_category_pk());
		
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
			CompanyManagerDto companyManagerDto=companySqlMapper.companyManagerSelectByPk(companyDto.getCom_manager_pk());
			
			Map<String, Object> map=new HashMap<>();
			map.put("companyDto", companyDto);
			map.put("companyManagerDto", companyManagerDto);
			
			companyList.add(map);
		}
		
		return companyList;
	}
	
	//서치 되는 companyList
//	public List<Map<String, Object>> getCompanyListSearch(String searchType, String searchWord){
//		
//		List<Map<String, Object>> companyList=new ArrayList<>();
//		
//		List<CompanyDto> companyDtoList=companySqlMapper.selectCompanyAllSearch(searchType, searchWord);
//		
//		for(CompanyDto companyDto:companyDtoList) {
//			CompanyManagerDto companyManagerDto=companySqlMapper.companyManagerSelectByPk(companyDto.getCom_manager_pk());
//			
//			Map<String, Object> map=new HashMap<>();
//			map.put("companyDto", companyDto);
//			map.put("companyManagerDto", companyManagerDto);
//			
//			companyList.add(map);
//		}
//		
//		return companyList;
//	}
	
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
	
	//기업을 좋아요한 학생 목록
	public List<Map<String, Object>> studentCompanyInterestList(){
		
		List<Map<String, Object>> studentList=new ArrayList<>();
		
		List<InterestCompanyDto> interestCompanyDtoList=companySqlMapper.interestCompanySelectAll();
		
		for(InterestCompanyDto interestCompanyDto:interestCompanyDtoList) {
			CompanyDto companyDto=companySqlMapper.companySelectByPk(interestCompanyDto.getCom_pk());
			StudentInfoDto studentInfoDto=companySqlMapper.studentSelectByPk(interestCompanyDto.getStudent_pk());
			GraduationInfoDto graduationInfoDto=companySqlMapper.studentGraduationInfoSelectByPk(interestCompanyDto.getStudent_pk());
			
			Map<String, Object> interestCompanyMap=new HashMap<>();
			interestCompanyMap.put("interestCompanyDto", interestCompanyDto);
			interestCompanyMap.put("companyDto", companyDto);
			interestCompanyMap.put("studentInfoDto", studentInfoDto);
			interestCompanyMap.put("graduationInfoDto", graduationInfoDto);
			
			studentList.add(interestCompanyMap);
		}
		return studentList;
	}
	
	public List<Map<String, Object>> mainResumeListForCompany(){
		
		List<Map<String, Object>> mainResumeList=new ArrayList<>();
		
		List<ResumeDto> mainResumeDtoList=companySqlMapper.resumeListForFamilyCompany();
		
		for(ResumeDto resumeDto:mainResumeDtoList) {
			StudentInfoDto studentInfoDto=companySqlMapper.studentSelectByPk(resumeDto.getStudent_pk());
			GraduationInfoDto graduationInfoDto=companySqlMapper.studentGraduationInfoSelectByPk(resumeDto.getStudent_pk());
			
			Map<String, Object> mainResumeMap=new HashMap<>();
			
			mainResumeMap.put("resumeDto", resumeDto);
			mainResumeMap.put("studentInfoDto", studentInfoDto);
			mainResumeMap.put("graduationInfoDto", graduationInfoDto);
			
			mainResumeList.add(mainResumeMap);
		}
		
		return mainResumeList;
	}
	
	
	
	//사업자번호 중복확인
	public boolean existBusinessNumber(String business_number){
		
		return companySqlMapper.countByBusinessNumber(business_number)>0 ? true:false;
	}
	
	//외부인 계정 아이디 중복 확인
	public boolean existExternalId(String external_id){
		
		return companySqlMapper.countByExternalId(external_id)>0 ? true:false;
	}

	
	
}

package com.mkfactory.toothless.d.gw.company.mapper;

import java.util.List;

import com.mkfactory.toothless.d.dto.ComScaleCategoryDto;
import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.CompanyManagerDto;
import com.mkfactory.toothless.d.dto.InterestCompanyDto;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;

public interface CompanySqlMapper {

	//회사 insert
	public void insertCompany(CompanyDto companyDto);
	
	//회사 담당자 insert
	public void insertCompanyManager(CompanyManagerDto companyManagerDto);
	
	//회사 담당자 pk 생성
	public int creatCompanyManagerPK();
	
	//회사 규모 카테고리
	public List<ComScaleCategoryDto> selectComScaleCategoryAll();
	
	//외부인 pk 생성
	public int creatExternalPK(); 
	
	//외부인 계정 id 생성
	public void insertCompanyExternal(ExternalInfoDto externalInfoDto);

	//회사랑 회사 담당자 pk 뽑아내는거
	public CompanyDto companySelectById(int com_pk);
	public CompanyManagerDto companyManagerSelectById(int id);
	public ComScaleCategoryDto comScaleCategorySelectById(int id);
	
	//등록된 회사, 회사 담당자 전체 리스트
	public List<CompanyDto> selectCompanyAll();
	
	public List<CompanyManagerDto> selectCompanyManagerAll();
	
	
	//가족기업으로 업데이트
	public void changeFamilyCompany(int com_pk);
	
	//가족기업 일반기업으로 업데이트
	public void changeGeneralCompany(int com_pk);
	
	//기업정보 수정
	public void updateCompany(CompanyDto companyDto);
	public void updateCompanyManager(CompanyManagerDto companyManagerDto);
	
	//기업 정보 삭제
	public void deleteCompany(int com_pk);
	public void deleteCompanyManager(int com_manager_pk);
	public void deleteExternal(int external_pk);
	
	//기업 찜
	public void insertInterestCompany(InterestCompanyDto interestCompanyDto);
	
	//기업 찜 취소
	public void deleteInterestCompany(InterestCompanyDto interestCompanyDto);

	//학생이 기업 찜했나 카운트
	public int studentInterestCount(InterestCompanyDto interestCompanyDto);

	//기업 총 찜 카운트
	public int companyInterestCount(int com_pk);

}

package com.mkfactory.toothless.c.woojae.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Map<String, Object>> registedCompanyList(){
		
		List<Map<String, Object>> registedCompanyList = new ArrayList<Map<String,Object>>();
		
		List<AjdksCompanyInfoDto> list = woojaeExternalSqlMapper.selectRegisteredCompanyList();
		
		for(AjdksCompanyInfoDto ajdksCompanyInfoDto : list) {
			
			int companyCategoryPk = ajdksCompanyInfoDto.getCompany_category_pk();
			AjdksCompanyCategoryDto ajdksCompanyCategoryDto = woojaeExternalSqlMapper.selectBycompany_category_pk(companyCategoryPk);
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("ajdksCompanyCategoryDto", ajdksCompanyCategoryDto);
			map.put("ajdksCompanyInfoDto", ajdksCompanyInfoDto);
			registedCompanyList.add(map);
		}
		
		return registedCompanyList;
	}
	
	// 카테고리별 산업체 리스트
	public List<Map<String, Object>> getCompanyListByCategoryPk(int company_category_pk){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<AjdksCompanyInfoDto> CompanyListByCategoryPk = woojaeExternalSqlMapper.selectCompanyListByCategoryPk(company_category_pk);
		
		for(AjdksCompanyInfoDto ajdksCompanyInfoDto : CompanyListByCategoryPk) {
			
			AjdksCompanyCategoryDto ajdksCompanyCategoryDto = woojaeExternalSqlMapper.selectBycompany_category_pk(company_category_pk);
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("ajdksCompanyCategoryDto", ajdksCompanyCategoryDto);
			map.put("ajdksCompanyInfoDto", ajdksCompanyInfoDto);
			list.add(map);
		}
		
		return list;
	}
	
	// 사업자등록번호 확인
	public boolean existCompanyId(String company_id) {
		
		return woojaeExternalSqlMapper.countByCompanyId(company_id) > 0 ? true : false;
	}
	
	// 산업체 아이디 확인
	public boolean existByExternalId(String external_id) {
		
		return woojaeExternalSqlMapper.countByExternalId(external_id) > 0 ? true : false;
	}
	
}

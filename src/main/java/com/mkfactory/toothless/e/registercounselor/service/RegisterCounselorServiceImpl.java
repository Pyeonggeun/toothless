package com.mkfactory.toothless.e.registercounselor.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.CounselorTypeDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;
import com.mkfactory.toothless.e.registercounselor.mapper.RegisterCounselorSqlMapper;

@Service
public class RegisterCounselorServiceImpl {
	
	@Autowired
	RegisterCounselorSqlMapper registerCounselorSqlMapper;
	
	// 상담원 등록
	public void registerCounselor(
			ExternalInfoDto externalInfoDto,
			CounselorDto counselorDto,
			int[] counselorTypeList) {
		System.out.println("[ RegisterCounselorServiceImpl] => [ registerCounselor ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		int externalPk = registerCounselorSqlMapper.createExternalPk();
		externalInfoDto.setExternal_pk(externalPk);
		registerCounselorSqlMapper.insertExternalInfo(externalInfoDto);		
		
		int counselorPk = registerCounselorSqlMapper.createCounselorPk();
		counselorDto.setId(counselorPk);
		counselorDto.setExternal_pk(externalPk);		
		registerCounselorSqlMapper.insertCounselor(counselorDto);
		
		for(int type_category_id : counselorTypeList) {
			CounselorTypeDto counselorTypeDto = new CounselorTypeDto();
			counselorTypeDto.setType_category_id(type_category_id);
			counselorTypeDto.setCounselor_id(counselorPk);
			registerCounselorSqlMapper.insertCounselorType(counselorTypeDto);
		}
		
	}
	
	// 상담 카테고리 리스팅
	public List<TypeCategoryDto> getAllTypeCategoryList(){		
		System.out.println("[ RegisterCounselorServiceImpl] => [ getAllTypeCategoryList ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		List<TypeCategoryDto> typeCategoryList = registerCounselorSqlMapper.selectAllTypeCategory();
		return typeCategoryList;
	}
	
	// 상담원 전체 리스팅(카테고리 포함)
	public List<Map<String, Object>> getAllCounselorList() {
		System.out.println("[ RegisterCounselorServiceImpl] => [ getAllCounselorList ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		List<Map<String, Object>> counselorList = registerCounselorSqlMapper.selectAllCounselor();
		return counselorList;
		
	}
	
	// 상담원PK로 상담원정보 조회
	public CounselorDto getCounselorInfo(int id){
		System.out.println("[ RegisterCounselorServiceImpl] => [ getCounselorInfo ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		CounselorDto counselorDto = registerCounselorSqlMapper.selectCounselorDetailByCounselorId(id);
		String career = counselorDto.getCareer();
		career = StringEscapeUtils.escapeHtml4(career);
		career.replaceAll("\n", "<br>");
		career.replaceAll("<", "&lt;");
		career.replaceAll(">", "&gt;");
		counselorDto.setCareer(career);
		
		return counselorDto;
	}
	
	// 상담원PK로 상담원담당카테고리 조회
	public List<Map<String, Object>> getCounselorTypeByCounselorId(int id){
		System.out.println("[ RegisterCounselorServiceImpl] => [ getCounselorTypeByCounselorId ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		List<Map<String, Object>> counselorTypeList = registerCounselorSqlMapper.selectCounselorTypeByCounselorId(id);
		
		return counselorTypeList;
	}
}

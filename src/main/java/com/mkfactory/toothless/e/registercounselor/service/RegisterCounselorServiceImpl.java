package com.mkfactory.toothless.e.registercounselor.service;

import java.util.List;

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
}

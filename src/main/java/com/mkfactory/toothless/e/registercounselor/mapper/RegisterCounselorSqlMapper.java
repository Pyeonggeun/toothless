package com.mkfactory.toothless.e.registercounselor.mapper;

import java.util.List;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.CounselorTypeDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;

public interface RegisterCounselorSqlMapper {
	
	// 외부사용자테이블 PK생성
	public int createExternalPk();
	
	// 외부사용자테이블 insert
	public void insertExternalInfo(ExternalInfoDto externalInfoDto);
	
	// 상담원 PK 생성
	public int createCounselorPk();
	
	// 상담원 등록
	public void insertCounselor(CounselorDto counselorDto);
	
	// 상담종류 카테고리 리스팅
	public List<TypeCategoryDto> selectAllTypeCategory();
	
	// 상담원별 담당 카테고리 인서트
	public void insertCounselorType(CounselorTypeDto counselorTypeDto);

}

package com.mkfactory.toothless.e.registercounselor.mapper;

import java.util.List;
import java.util.Map;

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
	
	// 상담원 전체 리스팅
	public List<Map<String, Object>> selectAllCounselor();
	
	// 상담원PK로 상담원 정보 조회
	public CounselorDto selectCounselorDetailByCounselorId(int id);
	
	// 상담종류 카테고리 리스팅
	public List<TypeCategoryDto> selectAllTypeCategory();
	
	// 상담원별 담당 카테고리 인서트
	public void insertCounselorType(CounselorTypeDto counselorTypeDto);
	
	// 상담원PK로 담당카테고리 조회
	public List<Map<String, Object>> selectCounselorTypeByCounselorId(int id);
	
	

}

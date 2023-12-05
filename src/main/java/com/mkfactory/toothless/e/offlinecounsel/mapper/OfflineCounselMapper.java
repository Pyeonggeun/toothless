package com.mkfactory.toothless.e.offlinecounsel.mapper;

import java.util.List;

import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.CounselorTypeDto;
import com.mkfactory.toothless.e.dto.OfflineReservationDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;

public interface OfflineCounselMapper {
	
	// 오프라인 상담 예약 pk_seq 추출
	public int createOfflineReservationPk();
	
	// 상담 카테고리 리스트
	public List<TypeCategoryDto> selectTypeCategoryList();
	
	// 카테고리별 상담원 목록
	public List<CounselorTypeDto> selectCounselorTypeList(int type_category_id);
	
	// 상담원 번호별 Dto
	public CounselorDto selectCounselorInfo(int id); 
	
	// 상담 예약 테이블 insert
	public void insertOfflineReservationInfo(OfflineReservationDto offlineReservationDto);
	
	// 신청완료페이지 정보 추출
	public OfflineReservationDto selectOfflineReservationCompletedInfo(int id);
	
	// 카테고리Dto 추출
	public TypeCategoryDto selectTypeCategoryDtoById(int id);

}

package com.mkfactory.toothless.e.offlinecounsel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.CounselDocumentDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.CounselorTypeDto;
import com.mkfactory.toothless.e.dto.OfflineReservationDto;
import com.mkfactory.toothless.e.dto.OfflineSurveyDto;
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
	
	// 상담원별 예약된 날짜 리스트
	public List<String> selectReservationDateInfoByCounselorId(int counselor_id);
	
	// 상담원별 예약 리스트
	public List<OfflineReservationDto> selectReservationListByCounselorId(int counselor_id);
	
	// 학생dto 출력
	public StudentInfoDto selectStudentInfoByStudentPk(int student_pk);
	
	// 외부사용자pk로 상담원Dto 출력
	public CounselorDto selectCounselorInfoByExternalPk(int external_pk);
	
	// 상담일지 insert
	public void insertCounselDocument(@Param("reservation_id") int id, @Param("text") String text);
	
	// 예약 테이블 상태 update
	public void updateCounselReservationState(@Param("id") int id, @Param("state") String state);
	
	// 상담일지Dto 출력
	public CounselDocumentDto selectCounselDocumentInfoByReservationId(int reservation_id);
	
	// 학생별 예약 리스트
	public List<OfflineReservationDto> selectCounselReservationList(int student_pk);
	
	// 만족도조사 insert
	public void insertOfflineSurvey(OfflineSurveyDto offlineSurveyDto);
	
	// 예약Pk별 리뷰Dto
	public OfflineSurveyDto selectOfflineSurveryInfo(int reservation_id);
	
}

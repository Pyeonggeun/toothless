package com.mkfactory.toothless.a.staff.mj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;

public interface DormStaffSqlMapper {
	
	// 학년도/학기 등록
	public void insertYear(SemesterDto semesterDto);

	// 학년도/학기 조회
	public List<SemesterDto> selectYearList();
	
	// 현재 학년도/학기 조회
	public SemesterDto selectThisSemester();
	
	// 입주공고 등록
	public void insertInfo(JoinDormInfoDto joinDormInfoDto);
	
	// 공고 전체 조회
	public List<JoinDormInfoDto> selectAllDormInfoList();
	
	// 입사신청 전체 조회
	public List<JoinDormApplicationDto> selectAllDormApplyList();

	// 선발상태 업데이트
	public void updateSelectionStatus(
			@Param("selection_status") String selection_status, 
			@Param("dorm_application_pk") int dorm_application_pk
			);

	// 선발된 정보 전체 조회
	public List<JoinDormApplicationDto> selectAllDormSelectedList();
	
	// 납부상태 업데이트
	public void updatePaymentStatus(
			@Param("payment_status") String payment_status, 
			@Param("dorm_application_pk") int dorm_application_pk
			);
	
	// 선발인원 중 납부완료 리스트
	public List<JoinDormApplicationDto> selectPaymentYesList();
	
	// 선발인원 중 미납부 리스트
	public List<JoinDormApplicationDto> selectPaymentNoList();
	
	
	
	
}

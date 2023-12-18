package com.mkfactory.toothless.a.staff.mj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.a.dto.DormNoticeDto;
import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.dto.SemesterDto;

public interface DormStaffSqlMapper {
	
	// 학년도/학기 등록
	public void insertYear(SemesterDto semesterDto);
	
	// 현재 학기 선택 
	public void updateThisSemester(int SEMESTER_PK);
	
	// 현재 학기 아닌것들
	public void updateNotThisSemester(int SEMESTER_PK);
	
	// 특정 학기 삭제
	public void deleteSemester(int SEMESTER_PK);
	
	// 특정 학기에 등록된 공고 개수
	public int countSomeSemesterJoinInfo(int SEMESTER_PK);
	
	// 특정 공고에 신청한 입주신청 개수
	public int countSomeApplyInfo(int DORM_INFO_PK);

	// 학년도/학기 조회
	public List<SemesterDto> selectYearList();
	
	// 현재 학년도/학기 조회
	public SemesterDto selectThisSemester();
	
	// 입주공고 등록
	public void insertInfo(JoinDormInfoDto joinDormInfoDto);
	
	// 입주공고 수정
	public void updateJoinInfo(JoinDormInfoDto joinDormInfoDto);
	
	// 입주공고 삭제
	public void deleteJoinInfo(int DORM_INFO_PK);
	
	// 진행중 학기 공고 전체 조회
	public List<JoinDormInfoDto> selectAllDormInfoList();
	
	// 현재학기에 해당하는 년도의 모든 학기들..
	public List<Map<String, Object>> selectThisYearAllSemester();
	
	// 이전년도들..
	public List<Map<String, Object>> selectBeforeYearAll();
	
	// 이전년도의 모든 학기들..
	public List<Map<String, Object>> selectBeforeYearAllSemester();
	
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
	
	// -----------------------------
	// 메인페이지 공고리스트
	public List<DormNoticeDto> selectDormNotice();
	
	// 현황
	public int countExecutive();
	public int countTodayDiary();
	public int countPlusPointDormStudent();
	public int countMinusPointDormStudent();
	public int countTodayExit();
	public int countTodayCallAbsence();
	
	// 현재 배정 인원 ㅋ왜 나만한개야
	public int assignedDormStudentCount();

}

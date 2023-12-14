package com.mkfactory.toothless.x.mj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.x.dto.LectureCategoryDto;
import com.mkfactory.toothless.x.dto.LectureInfoDto;
import com.mkfactory.toothless.x.dto.LifeLecturerDto;
import com.mkfactory.toothless.x.dto.PossibleLectureDto;

public interface LifeStaffSqlMapper {
	
	// 강사 pk 생성
	public int createTeacherPk();
	
	// 강사 정보 등록
	public void insertTeacherInfo(LifeLecturerDto lifeLecturerDto);
	
	// 강사 정보 수정
	public void updateTeacherInfo(LifeLecturerDto lifeLecturerDto);
	
	// 특정 강사 정보조회
	public LifeLecturerDto selectSomeTeacher(int lecturer_key);
	
	// 강사별 가능한 강의 정보 등록
	public void insertPossibleLecture(PossibleLectureDto possibleLectureDto);
	
	// 강사별 가능한 강의 정보 수정(그냥 삭제하고 인서트할래)
	public void deletePossibleLecture(int lecturer_key);

	// 교육과정 리스트 조회
	public List<LectureCategoryDto> selectLectureCategory();
	
	// 아직 강사등록 안된 사람들
	public List<ExternalInfoDto> selectNotYetTeacher();
	
	// 전체 강사목록 조회
	public List<LifeLecturerDto> selectAllTeacherList();
	
	// 강사별 가능한 과목 리스트 조회
	public List<LectureCategoryDto> selectPossibleLectuer(int lecturer_key);

	// 특정 강사 외부인 회원가입 정보
	public ExternalInfoDto selectSomeTeacherExternalInfo(int lecturer_key);
	
	
	
	/*
	public List<Map<String, Object>> selectBeforeYearAllSemester();
	
	// 입사신청 전체 조회
	public List<LectureCategoryDto> selectAllDormApplyList();

	// 선발상태 업데이트
	public void updateSelectionStatus(
			@Param("selection_status") String selection_status, 
			@Param("dorm_application_pk") int dorm_application_pk
			);
	*/
	
}

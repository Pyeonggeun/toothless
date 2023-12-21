package com.mkfactory.toothless.x.mj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.x.dto.ApplyConditionDto;
import com.mkfactory.toothless.x.dto.LectureCategoryDto;
import com.mkfactory.toothless.x.dto.LectureInfoDto;
import com.mkfactory.toothless.x.dto.LifeLecturerDto;
import com.mkfactory.toothless.x.dto.LifeStudentDto;
import com.mkfactory.toothless.x.dto.OpenLectureDto;
import com.mkfactory.toothless.x.dto.PossibleLectureDto;

public interface LifeStaffSqlMapper {
	
	// 강사 pk 생성
	public int createTeacherPk();
	
	// 강사 정보 등록
	public void insertTeacherInfo(LifeLecturerDto lifeLecturerDto);
	
	// 강사 정보 수정
	public void updateTeacherInfo(LifeLecturerDto lifeLecturerDto);
	
	// 강사 정보 삭제
	public void deleteTeacherInfo(int lecturer_key);
	
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
	
	
	// ============== 여기부터 학생관련 =======================
	
	// 아직 학생등록 안된 사람들
	public List<ExternalInfoDto> selectNotYetStudent();
	
	// 학생 정보 등록 
	public void insertStudentInfo(LifeStudentDto lifeStudentDto);
	
	// 전체 학생목록 조회
	public List<LifeStudentDto> selectAllStudentList();
	
	// 특정 학생 정보조회
	public LifeStudentDto selectSomeStudentInfo(int life_student_key);
	
	// 특정 학생 외부인 회원가입 정보
	public ExternalInfoDto selectSomeStudentExternalInfo(int life_student_key);
	
	// 학생 정보 수정
	public void updateStudentInfo(LifeStudentDto lifeStudentDto);
	
	// 학생 정보 삭제
	public void deleteStudentInfo(int life_student_key);
	
	// ============== 여기부터 교육과정 관련 =======================
	
	// 기본 수업 정보 등록
	public void insertLectureInfo(LectureInfoDto lectureInfoDto);
	
	// 전체 교육과정 목록 조회
	public List<LectureInfoDto> selectAllLectureInfoList();
	
	// 특정 강의 정보조회
	public LectureInfoDto selectSomeLectureInfo(int lecture_info_key);
	
	// 강의 정보 수정
	public void updateLectureInfo(LectureInfoDto lectureInfoDto);
	
	// 강의 정보 삭제
	public void deleteLectureInfo(int lecture_info_key);
	
	// 강의 정보 삭제되면 그에 따른 개설강의들도 삭제
	public void deleteOpenLectureInfoByLecKey(int lecture_info_key);
	
	// 강의별 수강신청 조건 리스트 
	public List<ApplyConditionDto> selectConditionListByLectureKey(int lecture_info_key);
	
	// 강의별 수강신청 정보 삭제
	public void deleteConditionList(int lecture_info_key);
	
	// 강의별 수강신청 정보 등록
	public void insertConditionInfo(ApplyConditionDto applyConditionDto);
	
	// 교육과정 카테고리 정보 등록
	public void insertCategory(LectureCategoryDto lectureCategoryDto);
	
	// 교육과정 카테고리 정보 삭제
	public void deleteCategory(int lecture_category_key);
	
	// 교육과정 카테고리 정보 삭제되면 그 카테고리 수업들도 삭제
	public void deleteLectureListByCategoryKey(int lecture_category_key);
	
	// 교육과정 카테고리 정보 삭제되면 그 카테고리 가능 정보들도 삭제
	public void deletePossibleByCategoryKey(int lecture_category_key);
	
	// 카테고리별 강의 리스트
	public List<LectureInfoDto> getLectureListByCategory(int lecture_category_key);
	
	// 카테고리별 강사 리스트 中 개강일~종강일 사이에 수업없는 애들
	public List<LifeLecturerDto> getTeacherListByCategory(
			@Param("lecture_category_key") int lecture_category_key,
			@Param("insertOpenDate") String insertOpenDate,
			@Param("insertCloseDate") String insertCloseDate
			);
	
	// 신규강의 개설
	public void insertOpenLecture(OpenLectureDto openLectureDto);
	
	// 개설강의 리스트
	public List<OpenLectureDto> selectAllOpenLecture();
	
	// 특정 강의 정보조회
	public OpenLectureDto selectSomeOpenLectureInfo(int open_lecture_key);
	
	// 개설 강의 정보 수정
	public void updateOpenLectureInfo(OpenLectureDto openLectureDto);
	
	// 개설 강의 정보 삭제
	public void deleteOpenLectureInfo(int open_lecture_key);
	
	// 수강신청된 강의 - 수정불가하게
	public List<OpenLectureDto> selectNoUpdateLecture();
	
	// 월별 수강신청 정보 리스트
	public List<Map<Object, String>> selectMonthlyOpenLectureList(int month);
	
	
	
	
	
	
	
	

	
}

package com.mkfactory.toothless.c.eunbi.mapper;

import java.util.List;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyEvaluationDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyTimecardDto;
import com.mkfactory.toothless.c.dto.AjdksInternReportDto;
import com.mkfactory.toothless.c.dto.AjdksInternSatisfactionDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.dto.AjdksProfessorEvaluationDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionImgDto;
import com.mkfactory.toothless.c.dto.AjdksStudentApplyingDto;
import com.mkfactory.toothless.c.dto.AjdksStudentInternDto;
import com.mkfactory.toothless.c.dto.AjdksTimecardCategoryDto;
import com.mkfactory.toothless.donot.touch.dto.DepartmentCategoryDto;
import com.mkfactory.toothless.donot.touch.dto.SemesterInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface EunbiStudentSqlMapper {

	// 학생키로 학생 정보 조회
	public StudentInfoDto getStudentInfoByStudentPk(int student_pk);
	// 학기 계산
	public int countSemester(int student_pk);
	
	// 학생의 현장실습과정 지원상태 조회
	public List<AjdksStudentApplyingDto> getStudentApplying(int student_pk);
	public Integer getLatestStudentApplyingPk(int student_pk);
	public AjdksStudentApplyingDto getLatestStudentApplyingDto(int student_applying_pk);
	
	// 학생의 현장실습과정 참가내역 조회
	public List<AjdksStudentInternDto> getStudentInternHistory(int student_pk);
	
	public List<AjdksStudentInternDto> getStudentInternByCoursePk(int internship_course_pk);
	
	// 학생 기업만족도 평가
	public void insertInternSatisfaction(AjdksInternSatisfactionDto ajdksInternSatisfactionDto);
	
	// 학생 과 이름 조회
	public DepartmentCategoryDto getDepartmentByDepartmentPk(int department_pk);
	
	// 해당 실습과정의 학생 조회
	public int countInternBycoursePk(int internship_course_pk);
	// 해당 실습과정의 신청학생 조회
	public List<AjdksStudentApplyingDto> getApplyingListByCoursePk(int internship_course_pk);
	// 해당 실습과정 신청 결과난 학생 조회
	public List<AjdksStudentApplyingDto> getAnnouncedStudentListByCoursePk(int internship_course_pk);
	
	// 실습생의 출결 조회
	public int countAttendance(int student_intern_pk);
	public int countLate(int student_intern_pk);
	public int countEarlyleave(int student_intern_pk);
	public int countAbsent(int student_intern_pk);
	
	// 학생 이력서 출력
	public AjdksSelfIntroductionDto getSelfIntroductionByStudentPk(int student_pk);
	public List<AjdksCertificationDto> getCertificationsByStudentPk(int student_pk);
	
	public AjdksSelfIntroductionImgDto getIntroductionImg(int student_pk);
	
	// 학생의 실습과정 중 실습 끝난 과정
	public List<AjdksInternshipCourseDto> getEndInternshipCourseByStudentPk(int student_pk);
	
	// 만족도 조사 했는지
	public int getInternPkByStudentPkAndCoursePk(int student_pk, int internship_course_pk);
	public int didSatisfaction(int student_intern_pk);
	
	// 성적 산출
	public String calculateGrade(int student_intern_pk);
	
	public AjdksProfessorEvaluationDto getProfessorEvaluation(int student_intern_pk);
	public AjdksCompanyEvaluationDto getCompanyEvaluation(int student_intern_pk);
	
	// 일지 상세
	public List<AjdksCompanyTimecardDto> getCompanyTimecard(int student_intern_pk);
	public AjdksTimecardCategoryDto getCompanyTimecardCategory(int timecard_category_pk);
	public List<AjdksInternReportDto> getInternReport(int student_intern_pk);
	
	
	
	
	// 검색필터 입학 년도 ,학기 걸기 위한 코드
	public List<SemesterInfoDto> forSelectSemester();	
	// 검색필터 전공
	public List<DepartmentCategoryDto> forSelectDepartment();
	

	
}

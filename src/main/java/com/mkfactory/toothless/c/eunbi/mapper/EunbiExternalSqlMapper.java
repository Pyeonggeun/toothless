package com.mkfactory.toothless.c.eunbi.mapper;

import java.util.List;

import com.mkfactory.toothless.c.dto.AjdksCompanyEvaluationDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;

public interface EunbiExternalSqlMapper {
	
	// 산업체 Pk 가져오기
	public int getCompanyPk(int external_pk);
	
	// 산업체의 학생 평가 입력
	public void insertCompanyEvaluation(AjdksCompanyEvaluationDto ajdksCompanyEvaluationDto);
	
	// 산업체 정보 가져오기
	public AjdksCompanyInfoDto getCompanyInfo(int company_pk);
	
	// 현장실습과정 가져오기
	public AjdksInternshipCourseDto getInternshipCourseDetail(int internship_course_pk);
	// 실습기간이 끝난 과정
	public List<AjdksInternshipCourseDto> getEndInternshipCourse(int company_pk);
	// 위코드 널 방지
	public int isEndCourseNull(int company_pk);
	
	// 산업체가 실습과정별 인턴들에게 평가 내렸는지? (평가내린 인턴 count)
	public int countCompanyEvaluationToIntern(int internship_course_pk);
	// 산업체가 개별 인턴한테 평가 내렸는지
	public int didCompanyEvaluateIntern(int student_intern_pk);
	
	
	// 현장실습 과정의 날짜 비교
	public int isStartApplying(int internship_course_pk);
	public int isEndApplying(int internship_course_pk);
	public int didAnnouncement(int internship_course_pk);
	public int isStartInternship(int internship_course_pk);
	public int isEndInternship(int internship_course_pk);
	
	
	
}

package com.mkfactory.toothless.c.eunbi.mapper;

import com.mkfactory.toothless.c.dto.AjdksCompanyEvaluationDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;

public interface EunbiExternalSqlMapper {
	
	// 산업체의 학생 평가 입력
	public void insertCompanyEvaluation(AjdksCompanyEvaluationDto ajdksCompanyEvaluationDto);
	
	// 산업체 정보 가져오기
	public AjdksCompanyInfoDto getCompanyInfo(int company_pk);
	
	// 현장실습과정 가져오기
	public AjdksInternshipCourseDto getInternshipCourseDetail(int internship_course_pk);
	
	
}

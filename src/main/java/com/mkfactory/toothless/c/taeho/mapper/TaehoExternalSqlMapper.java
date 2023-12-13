package com.mkfactory.toothless.c.taeho.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyTimecardDto;

public interface TaehoExternalSqlMapper {

	public AjdksCompanyInfoDto selectSessionCompanyInfoByExternalPk(int external_pk);
	
	public List<Map<String, Object>> selectIngInternshipCourseByExternalPk(int external_pk);
	
	public Map<String, Object> selectInternshipCourseInfoByInternshipCoursePk(int internship_course_pk);
	
	public List<Map<String, Object>> selectStudentInternByInternshipCoursePk(int internship_course_pk);
	
	public void insertTimecardByStudentInternPk(AjdksCompanyTimecardDto ajdksCompanyTimecardDto);
	
}

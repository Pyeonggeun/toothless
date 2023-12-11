package com.mkfactory.toothless.c.taeho.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.c.dto.AjdksInternReportDto;

public interface TaehoStudentSqlMapper {

	public Map<String, Object> selectInternshipCourseInfoByStudentPk(int student_pk);
		
	public List<Map<String, Object>> selectAttendanceCountByStudentPk(int student_pk);
	
	public List<Map<String, Object>> selectIngInternReportByStudentPk(int student_pk);
	
	public void insertInternReport(AjdksInternReportDto ajdksInternReportDto);
	
	
	
	
}

package com.mkfactory.toothless.c.taeho.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksInternReportDto;
import com.mkfactory.toothless.c.taeho.mapper.TaehoStudentSqlMapper;

@Service
public class TaehoStudentServiceImpl {
	
	@Autowired
	private TaehoStudentSqlMapper taehoStudentSqlMapper;
	
	public Map<String, Object> getInternshipCourseInfoByStudentPk(int studentPk) {
		
		Map<String, Object> map = taehoStudentSqlMapper.selectInternshipCourseInfoByStudentPk(studentPk);
		
		return map;
	}
	
	public List<Map<String, Object>> getAttendanceCountByStudentPk(int studentPk){
		
		List<Map<String, Object>> list = taehoStudentSqlMapper.selectAttendanceCountByStudentPk(studentPk);
		
		return list;
		
	}
	
	public List<Map<String, Object>> getIngInternReportByStudentPk(int studentPk){
		
		List<Map<String, Object>> list = taehoStudentSqlMapper.selectIngInternReportByStudentPk(studentPk);
		
		return list;
		
	}
	
	public void registerInternReport(AjdksInternReportDto ajdksInternReportDto) {
		
		taehoStudentSqlMapper.insertInternReport(ajdksInternReportDto);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

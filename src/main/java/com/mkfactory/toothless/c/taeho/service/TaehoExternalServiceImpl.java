package com.mkfactory.toothless.c.taeho.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyTimecardDto;
import com.mkfactory.toothless.c.taeho.mapper.TaehoExternalSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;

@Service
public class TaehoExternalServiceImpl {
	
	@Autowired
	private TaehoExternalSqlMapper taehoExternalSqlMapper;

	public AjdksCompanyInfoDto getSessionCompanyInfoByExternalPk(int externalPk){
		
		return taehoExternalSqlMapper.selectSessionCompanyInfoByExternalPk(externalPk);
	}
	
	
	public List<Map<String, Object>> getIngInternshipCourseByExternalPk(int externalPk){
		
		return taehoExternalSqlMapper.selectIngInternshipCourseByExternalPk(externalPk);
		
	}
	
	public Map<String, Object> getInternshipCourseInfoByInternshipCoursePk( int internshipCoursePk){
		
		return taehoExternalSqlMapper.selectInternshipCourseInfoByInternshipCoursePk(internshipCoursePk); 
	}
	
	public List<Map<String, Object>> getStudentInternByInternshipCoursePk(int internshipCoursePk){
		
		return taehoExternalSqlMapper.selectStudentInternByInternshipCoursePk(internshipCoursePk);
	}
	
	public void registerTimecardByStudentInternPk(AjdksCompanyTimecardDto ajdksCompanyTimecardDto) {
		
		taehoExternalSqlMapper.insertTimecardByStudentInternPk(ajdksCompanyTimecardDto);
		
	}
	
	
	
	
	
	
	
	
	
}

package com.mkfactory.toothless.b.hs.edu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.EduApplyDto;
import com.mkfactory.toothless.b.dto.EduDto;
import com.mkfactory.toothless.b.dto.EduStsfcSurveyDto;
import com.mkfactory.toothless.b.hs.edu.mapper.EduStaffSqlMapper;
import com.mkfactory.toothless.b.hs.edu.mapper.EduStudentSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class EduStudentServiceimpl {
	
	@Autowired
	EduStudentSqlMapper eduStudentSqlMapper;
	
	@Autowired
	EduStaffSqlMapper eduStaffSqlMapper;
	
	//프로그램 신청
	public void eduApply(EduApplyDto eduApplyDto) {
		
		eduStudentSqlMapper.apply(eduApplyDto);
	}
	
	public EduDto getEduInfoByEduPk(int edu_pk) {
		
		return  eduStudentSqlMapper.selectEduInfoByEduPk(edu_pk);
	}
	
	//나의 프로그램 리스트
	public List<Map<String, Object>> getMyEduList(int studentPk){
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<EduApplyDto> MyEduList = eduStudentSqlMapper.selectMyEduList(studentPk);
		
		for(EduApplyDto eduApplyDto : MyEduList) {
			StudentInfoDto studentInfoDto = eduStudentSqlMapper.selectByIdStudent(studentPk);
		
			EduDto eduDto = eduStaffSqlMapper.selectByEdu_pk(eduApplyDto.getEdu_pk());
	
			Map<String, Object> map = new HashMap<>();
			map.put("eduApplyDto", eduApplyDto);
			map.put("studentInfoDto", studentInfoDto);
			map.put("eduDto", eduDto);

			list.add(map);
		}
		return list;
	}
	
	//나의 만족도 리스트 ㅎㅎ
	public List<Map<String, Object>> getMyServeyList(int studentPk){
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<EduStsfcSurveyDto> MyServeyList = eduStudentSqlMapper.selectMyServeyList(studentPk);
		
		for(EduStsfcSurveyDto eduStsfcSurveyDto : MyServeyList) {
//			EduDto eduDto = eduStaffSqlMapper.selectByEdu_pk(EduApplyDto.getEdu_pk());
			
			Map<String, Object> map = new HashMap<>();
			int edu_apply_pk = eduStsfcSurveyDto.getEdu_apply_pk();
			
			
			map.put("eduStsfcSurveyDto", eduStsfcSurveyDto);
			map.put("name", eduStudentSqlMapper.selectMyEduName(edu_apply_pk));
			
			list.add(map);
		}
		
		return list;
	}
	
	//만족도 작성
	public void writeEduServey(EduStsfcSurveyDto eduStsfcSurveyDto) {
		eduStudentSqlMapper.insertMyServey(eduStsfcSurveyDto);
	}
	
	
	
	
	
	
	
}

package com.mkfactory.toothless.b.hs.edu.mapper;

import java.util.List;
import com.mkfactory.toothless.b.dto.EduApplyDto;
import com.mkfactory.toothless.b.dto.EduStsfcSurveyDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface EduStudentSqlMapper {
	
	//프로그램 신청이요!
	public void apply(EduApplyDto eduApplyDto);
	
	//학생 내 프로그램목록 가져오기
	public List<EduApplyDto> selectMyEduList(int student_pk);
	
	//내 만족도 내역 가져와
	public List<EduStsfcSurveyDto> selectMyServeyList(int student_pk);
	
	public String selectMyEduName(int edu_apply_pk);
	
	
	//학생pk
	public StudentInfoDto selectByIdStudent(int id);
	
	//만족도 작성
	public void insertMyServey(EduStsfcSurveyDto eduStsfcSurveyDto);
	
	
	
}

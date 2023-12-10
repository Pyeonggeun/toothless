package com.mkfactory.toothless.b.hs.edu.mapper;

import java.util.List;

import com.mkfactory.toothless.b.dto.EduApplyDto;

public interface EduStudentSqlMapper {
	
	//프로그램 신청이요!
	public void apply(EduApplyDto eduApplyDto);
	
	//학생 내 프로그램목록 가져오기
	public List<EduApplyDto> selectMyEduList();
	
}

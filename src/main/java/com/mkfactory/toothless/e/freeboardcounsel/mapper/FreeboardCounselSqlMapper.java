package com.mkfactory.toothless.e.freeboardcounsel.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.FreeboardDto;

public interface FreeboardCounselSqlMapper {

	public void insertFreeboardPosts(FreeboardDto paraFreeboardDto);
	
	public List<FreeboardDto> selectfreeboardList();
	
	public StudentInfoDto selectStudentInfo(int student_pk);
	
	
	
}
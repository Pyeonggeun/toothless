package com.mkfactory.toothless.a.staff.mj.mapper;

import java.util.List;

import com.mkfactory.toothless.a.dto.SemesterDto;

public interface DormStaffSqlMapper {
	
	// 학년도/학기 등록
	public void insertYear(SemesterDto semesterDto);

	// 학년도/학기 조회
	public List<SemesterDto> selectYearList();
}

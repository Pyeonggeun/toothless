package com.mkfactory.toothless.a.staff.mj.mapper;

import java.util.List;

import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;

public interface DormStaffSqlMapper {
	
	// 학년도/학기 등록
	public void insertYear(SemesterDto semesterDto);

	// 학년도/학기 조회
	public List<SemesterDto> selectYearList();
	
	// 현재 학년도/학기 조회
	public SemesterDto selectThisSemester();
	
	// 입주공고 등록
	public void insertInfo(JoinDormInfoDto joinDormInfoDto);
	
	// 공고 전체 조회
	public List<JoinDormInfoDto> selectAllDormInfoList();
	
}

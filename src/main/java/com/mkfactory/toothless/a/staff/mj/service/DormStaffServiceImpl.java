package com.mkfactory.toothless.a.staff.mj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.staff.mj.mapper.DormStaffSqlMapper;

@Service
public class DormStaffServiceImpl {

	@Autowired
	private DormStaffSqlMapper staffSqlMapper;
	
	// 학년도/학기 등록
	public void registerYear(SemesterDto semesterDto) {
		
		staffSqlMapper.insertYear(semesterDto);
	}
	
	
	// 학년도/학기 조회
	public List<SemesterDto> getYearList() {
		
		return staffSqlMapper.selectYearList();
	}
	
	
}

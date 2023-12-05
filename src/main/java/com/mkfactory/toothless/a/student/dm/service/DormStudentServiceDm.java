package com.mkfactory.toothless.a.student.dm.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.student.dm.mapper.DormStudentSqlMapperDm;

@Service
public class DormStudentServiceDm {
	
	@Autowired
	public DormStudentSqlMapperDm dormStudentSqlMapperDm;
	
	public Map<String, Object> semesterByProgressState() {
		
		Map<String, Object> map = new HashMap<>();
		
		SemesterDto semesterDto = dormStudentSqlMapperDm.semesterByProgressState();
		int semester_pk = semesterDto.getSemester_pk();
		
		JoinDormInfoDto joinDormInfoDto = dormStudentSqlMapperDm.joinDormInfoBySemesterPk(semester_pk);
		
		map.put("joinDormInfoDto", joinDormInfoDto);
		map.put("semesterDto", semesterDto);
		
		
		return map;
	}
	
}

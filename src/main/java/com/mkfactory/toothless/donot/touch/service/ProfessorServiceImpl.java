package com.mkfactory.toothless.donot.touch.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;
import com.mkfactory.toothless.donot.touch.mapper.ProfessorSqlMapper;

@Service
public class ProfessorServiceImpl {
	@Autowired
	private ProfessorSqlMapper professorSqlMapper;
	
	public ProfessorInfoDto loginByProfessorIdAndPassword(ProfessorInfoDto professorInfoDto){
		
		return professorSqlMapper.selectProfessorByIdAndPassword(professorInfoDto);
		
	}
	
	public Map<String, Object> getProfessorInfo(int department_pk){
		Map<String, Object> map = new HashMap<>();
		String departmentName = professorSqlMapper.selectProfessorDepartmentName(department_pk);
		map.put("departmentName", departmentName);
		
		return map;
		
	}
}

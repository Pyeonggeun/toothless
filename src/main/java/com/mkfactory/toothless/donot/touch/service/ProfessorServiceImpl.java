package com.mkfactory.toothless.donot.touch.service;

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
}

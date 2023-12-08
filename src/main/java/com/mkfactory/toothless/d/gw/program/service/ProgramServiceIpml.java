package com.mkfactory.toothless.d.gw.program.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.ProgramCategoryDto;
import com.mkfactory.toothless.d.dto.ProgramDto;
import com.mkfactory.toothless.d.gw.program.mapper.ProgramSqlMapper;

@Service
public class ProgramServiceIpml {
	
	@Autowired
	private ProgramSqlMapper programSqlMapper;
	
	public List<ProgramCategoryDto> programCategory(){
		return programSqlMapper.selectProgramCategoryAll(); 
	}
	
	public void registerProgramInfo(ProgramDto programDto) {
		programSqlMapper.insertProgram(programDto);
	}

}

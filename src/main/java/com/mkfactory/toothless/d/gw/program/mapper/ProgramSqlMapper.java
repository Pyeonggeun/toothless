package com.mkfactory.toothless.d.gw.program.mapper;

import java.util.List;

import com.mkfactory.toothless.d.dto.ProgramCategoryDto;
import com.mkfactory.toothless.d.dto.ProgramDto;

public interface ProgramSqlMapper {
	
	//프로그램 카테고리 보이게
	public List<ProgramCategoryDto> selectProgramCategoryAll();
	
	//프로그램 입력
	public void insertProgram(ProgramDto programDto);

}

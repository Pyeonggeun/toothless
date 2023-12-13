package com.mkfactory.toothless.d.gw.program.mapper;

import java.util.List;

import com.mkfactory.toothless.d.dto.ProgramCategoryDto;
import com.mkfactory.toothless.d.dto.ProgramDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

public interface ProgramSqlMapper {
	
	//프로그램 카테고리 보이게
	public List<ProgramCategoryDto> selectProgramCategoryAll();
	
	//프로그램 입력
	public void insertProgram(ProgramDto programDto);
	
	//프로그램 전체 리스트
	public List<ProgramDto> programSelectAll();
	
	//프로그램이랑 프로그램 카테고리 pk로 하나씩만 뽑아오는거
	public ProgramDto programSelectByPk(int program_pk);
	public ProgramCategoryDto programCategorySelectByPk(int program_category_pk);
	public StaffInfoDto staffSelectByPk(int staff_pk);
	
	//프로그램 정보 수정
	public void updateProgram(ProgramDto programDto);
	
	//프로그램 정보 삭제
	public void deleteProgram(int program_pk);
}

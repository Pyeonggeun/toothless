package com.mkfactory.toothless.d.gw.program.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.ProgramCategoryDto;
import com.mkfactory.toothless.d.dto.ProgramDto;
import com.mkfactory.toothless.d.gw.program.mapper.ProgramSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Service
public class ProgramServiceIpml {
	
	@Autowired
	private ProgramSqlMapper programSqlMapper;
	
	//카테고리 목록
	public List<ProgramCategoryDto> programCategory(){
		return programSqlMapper.selectProgramCategoryAll(); 
	}
	
	//프로그램 정보 입력하는거
	public void registerProgramInfo(ProgramDto programDto) {
		programSqlMapper.insertProgram(programDto);
	}
	
	//프로그램 한개만 보는거
	public Map<String, Object> getProgram(int program_pk){
		
		Map<String, Object> programMap=new HashMap<>();
		
		ProgramDto programDto=programSqlMapper.programSelectByPk(program_pk);
		ProgramCategoryDto programCategoryDto=programSqlMapper.programCategorySelectByPk(programDto.getProgram_category_pk());
		StaffInfoDto staffInfoDto=programSqlMapper.staffSelectByPk(programDto.getStaff_pk());
		
		programMap.put("programCategoryDto", programCategoryDto);
		programMap.put("programDto", programDto);
		programMap.put("staffInfoDto", staffInfoDto);
		
		return programMap;
		
	}
	
	public List<Map<String, Object>> getProgramList(){
		
		List<Map<String, Object>> programList=new ArrayList<>();
		
		List<ProgramDto> programDtoList=programSqlMapper.programSelectAll();
		
		for(ProgramDto programDto:programDtoList) {
			
			ProgramCategoryDto programCategoryDto=programSqlMapper.programCategorySelectByPk(programDto.getProgram_category_pk());
			StaffInfoDto staffInfoDto=programSqlMapper.staffSelectByPk(programDto.getStaff_pk());
			
			Map<String, Object> programMap=new HashMap<>();
			
			programMap.put("programCategoryDto", programCategoryDto);
			programMap.put("programDto", programDto);
			programMap.put("staffInfoDto", staffInfoDto);
			
			programList.add(programMap);
			
		}
		return programList;
		
	}

}

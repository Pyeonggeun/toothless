package com.mkfactory.toothless.d.gw.program.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.InterestCompanyDto;
import com.mkfactory.toothless.d.dto.ProgramApplyDto;
import com.mkfactory.toothless.d.dto.ProgramCategoryDto;
import com.mkfactory.toothless.d.dto.ProgramDto;
import com.mkfactory.toothless.d.gw.company.mapper.CompanySqlMapper;
import com.mkfactory.toothless.d.gw.company.service.CompanyServiceIpml;
import com.mkfactory.toothless.d.gw.program.mapper.ProgramSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.GraduationInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class ProgramServiceIpml {
	
	@Autowired
	private ProgramSqlMapper programSqlMapper;
	
	@Autowired
	private CompanySqlMapper companySqlMapper;
	
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
		
		int applyProgramCount=programSqlMapper.programApplyCount(program_pk);
		
		programMap.put("programCategoryDto", programCategoryDto);
		programMap.put("programDto", programDto);
		programMap.put("staffInfoDto", staffInfoDto);
		programMap.put("applyProgramCount", applyProgramCount);
		
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
	
	public void updateProgramInfo(ProgramDto programDto) {
		programSqlMapper.updateProgram(programDto);
	}
	
	public void deleteProgramInfo(int program_pk) {
		programSqlMapper.deleteProgram(program_pk);
	}
	
	public void studentApplyProgram(ProgramApplyDto programApplyDto) {
		
		programSqlMapper.insertStudentProgramApply(programApplyDto);
	}
	
	public List<Map<String, Object>> studentApplyProgramList(){
		
		List<Map<String, Object>> applyProgramList=new ArrayList<>(); 
		
		List<ProgramApplyDto> programApplyDtoList=programSqlMapper.programApplySelectAll(); 
		
		for(ProgramApplyDto programApplyDto:programApplyDtoList) {
			
			ProgramDto programDto=programSqlMapper.programSelectByPk(programApplyDto.getProgram_pk());
			StudentInfoDto studentInfoDto=programSqlMapper.studentSelectByPk(programApplyDto.getStudent_pk());
			
			Map<String, Object> applyProgramMap=new HashMap<>();
			
			applyProgramMap.put("programApplyDto", programApplyDto);
			applyProgramMap.put("programDto", programDto);
			applyProgramMap.put("studentInfoDto", studentInfoDto);
			
			applyProgramList.add(applyProgramMap);
			
		}
		
		return applyProgramList;
	}
	
	public List<Map<String, Object>> applyProgramList(int program_pk){
		
		List<Map<String, Object>> applyProgramList=new ArrayList<>(); 
		
		List<ProgramApplyDto> programApplyDtoList=programSqlMapper.programApplySelectAll(); 
		
		for(ProgramApplyDto programApplyDto:programApplyDtoList) {
			
			if(programApplyDto.getProgram_pk()==program_pk) {
				ProgramDto programDto=programSqlMapper.programSelectByPk(programApplyDto.getProgram_pk());
				StudentInfoDto studentInfoDto=programSqlMapper.studentSelectByPk(programApplyDto.getStudent_pk());
				GraduationInfoDto graduationInfoDto=companySqlMapper.studentGraduationInfoSelectByPk(programApplyDto.getStudent_pk());
				
				
				Map<String, Object> applyProgramMap=new HashMap<>();
				
				applyProgramMap.put("programApplyDto", programApplyDto);
				applyProgramMap.put("programDto", programDto);
				applyProgramMap.put("studentInfoDto", studentInfoDto);
				applyProgramMap.put("graduationInfoDto", graduationInfoDto);
				
				applyProgramList.add(applyProgramMap);
			}
				
			
		}
		
		return applyProgramList;
	}

	public void countApplyProgram(int program_pk) {
		programSqlMapper.programApplyCount(program_pk);
	}
	
	public void changeStudentAttend(ProgramApplyDto programApplyDto) {
		
		programSqlMapper.changeStudentAttend(programApplyDto);
	}
	
	public void changeStudentUnAttend(ProgramApplyDto programApplyDto) {
		
		programSqlMapper.changeStudentUnAttend(programApplyDto);
	}
	
	//내가 신청 했나 카운트
	public int studentApplyCount(ProgramApplyDto programApplyDto) {
		return programSqlMapper.studentApplyCount(programApplyDto);
	}


}

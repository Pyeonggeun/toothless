package com.mkfactory.toothless.d.gw.program.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.InterestCompanyDto;
import com.mkfactory.toothless.d.dto.ProgramApplyDto;
import com.mkfactory.toothless.d.dto.ProgramCategoryDto;
import com.mkfactory.toothless.d.dto.ProgramDto;
import com.mkfactory.toothless.d.dto.ProgramReviewDto;
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
		
		String programContents = programDto.getPrg_contents();
		
		if (programContents != null) {
			programContents = StringEscapeUtils.escapeHtml4(programContents);
			programContents = programContents.replaceAll("\n", "<br>");
			programDto.setPrg_contents(programContents);
		}
		
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
		
		String programContents = programDto.getPrg_contents();
		
		if (programContents != null) {
			programContents = StringEscapeUtils.escapeHtml4(programContents);
			programContents = programContents.replaceAll("&lt;","<");
			programContents = programContents.replaceAll("&gt;",">");
			programContents = programContents.replaceAll("<br>","\n");
			programContents = programContents.replaceAll("\n", "<br>");
			programDto.setPrg_contents(programContents);
		}
		
		programSqlMapper.updateProgram(programDto);
	}
	
	public void deleteProgramInfo(int program_pk) {
		programSqlMapper.deleteProgram(program_pk);
	}
	
	public void studentApplyProgram(ProgramApplyDto programApplyDto) {
		
		programSqlMapper.insertStudentProgramApply(programApplyDto);
	}
	
	//학생용 프로그램 신청 목록
	public List<Map<String, Object>> studentApplyProgramList(){
		
		List<Map<String, Object>> applyProgramList=new ArrayList<>(); 
		
		List<ProgramApplyDto> programApplyDtoList=programSqlMapper.programApplySelectAll(); 
		
		for(ProgramApplyDto programApplyDto:programApplyDtoList) {
			
			ProgramDto programDto=programSqlMapper.programSelectByPk(programApplyDto.getProgram_pk());
			StudentInfoDto studentInfoDto=programSqlMapper.studentSelectByPk(programApplyDto.getStudent_pk());
			int programReviewCount=programSqlMapper.studentReviewCount(programApplyDto.getProgram_apply_pk());
			
			Map<String, Object> applyProgramMap=new HashMap<>();
			
			applyProgramMap.put("programApplyDto", programApplyDto);
			applyProgramMap.put("programDto", programDto);
			applyProgramMap.put("studentInfoDto", studentInfoDto);
			applyProgramMap.put("programReviewCount", programReviewCount);
			
			applyProgramList.add(applyProgramMap);
			
		}
		
		return applyProgramList;
	}
	
	//교직원용 프로그램 신청 목록
	public List<Map<String, Object>> applyProgramList(int program_pk){
		
		List<Map<String, Object>> applyProgramList=new ArrayList<>(); 
		
		List<ProgramApplyDto> programApplyDtoList=programSqlMapper.programApplySelectAll(); 
		
		for(ProgramApplyDto programApplyDto:programApplyDtoList) {
			
			if(programApplyDto.getProgram_pk()==program_pk) {
				ProgramDto programDto=programSqlMapper.programSelectByPk(programApplyDto.getProgram_pk());
				StudentInfoDto studentInfoDto=programSqlMapper.studentSelectByPk(programApplyDto.getStudent_pk());
				GraduationInfoDto graduationInfoDto=companySqlMapper.studentGraduationInfoSelectByPk(programApplyDto.getStudent_pk());
				ProgramReviewDto programReviewDto=programSqlMapper.programReviewForStaff(programApplyDto.getProgram_apply_pk());
				
				Map<String, Object> applyProgramMap=new HashMap<>();
				
				applyProgramMap.put("programApplyDto", programApplyDto);
				applyProgramMap.put("programDto", programDto);
				applyProgramMap.put("studentInfoDto", studentInfoDto);
				applyProgramMap.put("graduationInfoDto", graduationInfoDto);
				applyProgramMap.put("programReviewDto", programReviewDto);
				
				applyProgramList.add(applyProgramMap);
			}
				
			
		}
		
		return applyProgramList;
	}
	
	
	//프로그램 신청자 수
	public void countApplyProgram(int program_pk) {
		programSqlMapper.programApplyCount(program_pk);
	}
	
	//학생 프로그램 출석한걸로 바꾸기
	public void changeStudentAttend(ProgramApplyDto programApplyDto) {
		
		programSqlMapper.changeStudentAttend(programApplyDto);
	}
	
	//학생 프로그램 출석 안한걸로 바꾸기
	public void changeStudentUnAttend(ProgramApplyDto programApplyDto) {
		
		programSqlMapper.changeStudentUnAttend(programApplyDto);
	}
	
	//학생이 신청 했나 카운트
	public int studentApplyCount(ProgramApplyDto programApplyDto) {
		return programSqlMapper.studentApplyCount(programApplyDto);
	}

	//학생 프로그램 리뷰쓰기
	public void inputProgramReview(ProgramReviewDto programReviewDto) {
		programSqlMapper.insertProgramReview(programReviewDto);
	}
	
	public Map<String, Object> getApplyProgram(int program_apply_pk){
		
		Map<String, Object> applyProgramMap=new HashMap<>();
		
		ProgramApplyDto programApplyDto=programSqlMapper.studentApplySelect(program_apply_pk);
		ProgramDto programDto=programSqlMapper.programSelectByPk(programApplyDto.getProgram_pk());
		StudentInfoDto studentInfoDto=programSqlMapper.studentSelectByPk(programApplyDto.getStudent_pk());
		
		
		applyProgramMap.put("programApplyDto", programApplyDto);
		applyProgramMap.put("programDto", programDto);
		applyProgramMap.put("studentInfoDto", studentInfoDto);
		
		return applyProgramMap; 
	}
	
	
	//학생이 리뷰썼나 카운트
	public void studentReviewCount(int program_apply_pk) {
		programSqlMapper.studentReviewCount(program_apply_pk);
	}
	


}

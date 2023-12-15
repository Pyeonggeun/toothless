package com.mkfactory.toothless.d.gw.program.mapper;

import java.util.List;

import com.mkfactory.toothless.d.dto.ProgramCategoryDto;
import com.mkfactory.toothless.d.dto.ProgramDto;
import com.mkfactory.toothless.d.dto.ProgramReviewDto;
import com.mkfactory.toothless.d.dto.ProgramApplyDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

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
	
	public void insertStudentProgramApply(ProgramApplyDto programApplyDto);
	
	//신청한 프로그램 전체 뽑아내는거
	public List<ProgramApplyDto> programApplySelectAll();

	//학생 pk로 정보 하나씩만 뽑아오기
	public StudentInfoDto studentSelectByPk(int student_pk);
		
	public int programApplyCount(int program_pk);
	
	public void changeStudentAttend(ProgramApplyDto programApplyDto);

	public void changeStudentUnAttend(ProgramApplyDto programApplyDto);
	
	public int studentApplyCount(ProgramApplyDto programApplyDto);
	
	//리뷰 작성
	public void insertProgramReview(ProgramReviewDto programReviewDto);
	
	//학생이 프로그램 신청한거 정보 뽑아오기
	public ProgramApplyDto studentApplySelect(int program_apply_pk);
	
	//학생이 리뷰 썼나 카운트
	public int studentReviewCount(int program_apply_pk);

	//교직원이 프로그램 리뷰 보는거
	public ProgramReviewDto programReviewForStaff(int program_apply_pk);
	
	//프로그램 리뷰 전체 뽑아내기
	public List<ProgramReviewDto> programReviewSelectAll();
	
	//프로그램 번호로 신청자 뽑아오는거
	public ProgramApplyDto programApplyListForStaff(int program_pk);
	
}

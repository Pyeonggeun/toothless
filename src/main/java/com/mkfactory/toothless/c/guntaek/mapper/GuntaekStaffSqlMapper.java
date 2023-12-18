package com.mkfactory.toothless.c.guntaek.mapper;

import java.util.List;

import com.mkfactory.toothless.c.dto.AjdksInternEduApplying;
import com.mkfactory.toothless.c.dto.AjdksInternEduProgramDto;
import com.mkfactory.toothless.c.dto.AjdksInternEduReviewDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface GuntaekStaffSqlMapper {

	// 교육 프로그램 insert 
	public void registerEduProgram(AjdksInternEduProgramDto eduProgramDto);
	
	// 전체 교육 프로그램 리스트
	public List<AjdksInternEduProgramDto> getListEduProgram();
	
	// 특정 담당자 키에 해당하는 인춘형 꺼 담당자 Dto 가져오기
	public StaffInfoDto getStaffDtoByStaff(int staff_pk);

	// 특정 교육 키에 해당하는 교육 Dto 가져오기
	public AjdksInternEduProgramDto getEduProgramByPk(int program_pk);
	
	// 마감된 교육 프로그램 리스트 Dto 가져오기
	public List<AjdksInternEduProgramDto>getDeadLineProgram();
	
	// 진행중인 교육 프로그램 리스트 Dto 가져오기
	public List<AjdksInternEduProgramDto>getRecruitingProgram();
	
	// 담당자의 특정 교육 프로그램 삭제하기
	public void deleteProgramByStaff(int internedu_program_pk);
	
	// 특정 담당자의 교육 프로그램 리스트
	public List<AjdksInternEduProgramDto> getEduProgramByStaff(int staff_pk);
	
	public List<AjdksInternEduApplying> getInternEduApplyingByProgram(int internedu_program_pk);
	
	public void updateInternEduComplete(AjdksInternEduApplying eduApply);
	
	// 특정 교육 프로그램 평점 얻기
	public Double getProgramRatingByProgramPk(int internedu_program_pk);
	
	public List<AjdksInternEduReviewDto> getReviewDtoListByProgramPk(int internedu_program_pk);
	// 특정 댓글 삭제
	public void deleteProgramReview(int INTERNEDU_REVIEW_PK);
}

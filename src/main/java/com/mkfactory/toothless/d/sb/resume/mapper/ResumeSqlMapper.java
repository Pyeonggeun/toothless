package com.mkfactory.toothless.d.sb.resume.mapper;

import java.util.List;

import com.mkfactory.toothless.d.dto.ResumeDto;

public interface ResumeSqlMapper {

	// 이력서등록
	public void insertResumeDto(ResumeDto resumeDto);
	
	// 로그인 학생의 이력서 가져오기
	public List<ResumeDto> getResumeListByStudentPk(ResumeDto resumeDto);
	
	// 메인이력서 등록시 기존이력서 변경
	public void changeMainAndPublic(ResumeDto resumeDto);
	
	// 이력서 상세보기
	public ResumeDto getThisResumeDtoByResumePk(ResumeDto resumeDto);
	
	
}

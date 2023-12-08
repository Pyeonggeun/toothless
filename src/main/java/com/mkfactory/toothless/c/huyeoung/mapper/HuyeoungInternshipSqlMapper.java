package com.mkfactory.toothless.c.huyeoung.mapper;

import java.util.List;

import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;

public interface HuyeoungInternshipSqlMapper {

	// 현장관리 등록
	public void insertInternshipRegister(AjdksInternshipCourseDto ajdksInternshipCourseDto);

	// 현장관리 수정
	public void updateInternship(AjdksInternshipCourseDto ajdksInternshipCourseDto);

	// 현장관리 목록조회
	public List<AjdksInternshipCourseDto> selectInternshipAll(AjdksInternshipCourseDto ajdksInternshipCourseDto);

	// 현장관리 상세조회
	public AjdksInternshipCourseDto selectInternshipDtil(AjdksInternshipCourseDto ajdksInternshipCourseDto);

	// 사업체명 조회
	public AjdksCompanyInfoDto selectInternshipCompanyId(AjdksInternshipCourseDto ajdksInternshipCourseDto);

	// 교수리스트 조회(교수선택용)
	public List<ProfessorInfoDto> selectProfessorInfoList();

}

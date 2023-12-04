package com.mkfactory.toothless.c.guntaek.mapper;

import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;

public interface GuntaekStudentSqlMapper {

	// 이력서 insert
	public void registerSelfIntroduction(AjdksSelfIntroductionDto selfIntroductionDto);
	
	// 특정 학생키에 따른 이력서 개수
	public int countSelfIntroduction(int student_pk);
	
	// 특정 학생키에 따른 이력서 Dto 얻기
	public AjdksSelfIntroductionDto getSelfIntroductionDto(int student_pk);
	
	// 특정 학생키로 이력서 답변 수정
	public void updateSelfIntroductionDto(AjdksSelfIntroductionDto selfIntroductionDto);
}

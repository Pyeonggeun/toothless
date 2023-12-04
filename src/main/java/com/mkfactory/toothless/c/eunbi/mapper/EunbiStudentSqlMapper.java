package com.mkfactory.toothless.c.eunbi.mapper;

import java.util.List;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksInternSatisfactionDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;
import com.mkfactory.toothless.c.dto.AjdksStudentApplyingDto;
import com.mkfactory.toothless.c.dto.AjdksStudentInternDto;

public interface EunbiStudentSqlMapper {

	// 학생의 현장실습과정 지원상태 조회
	public AjdksStudentApplyingDto getStudentApplying(int student_pk);
	// 학생의 현장실습과정 참가내역 조회
	public AjdksStudentInternDto getStudentInternHistory(int student_pk);
	
	// 학생 기업만족도 평가
	public void insertInternSatisfaction(AjdksInternSatisfactionDto ajdksInternSatisfactionDto);
	
	// 학생 이력서 조회
	public AjdksSelfIntroductionDto getSelfIntroduction(int student_pk);
	public List<AjdksCertificationDto> getCertifications(int student_pk);
	
	
	
	
	
}

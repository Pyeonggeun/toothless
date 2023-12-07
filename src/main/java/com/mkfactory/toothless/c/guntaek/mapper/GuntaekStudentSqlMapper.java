package com.mkfactory.toothless.c.guntaek.mapper;

import java.util.List;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;

public interface GuntaekStudentSqlMapper {

	// 이력서 Dto insert
	public void registerSelfIntroduction(AjdksSelfIntroductionDto selfIntroductionDto);
	
	// 특정 학생키에 따른 이력서 개수
	public int countSelfIntroduction(int student_pk);
	
	// 특정 학생키에 따른 이력서 Dto 얻기
	public AjdksSelfIntroductionDto getSelfIntroductionDto(int student_pk);
	
	// 특정 학생키로 이력서 답변 수정
	public void updateSelfIntroductionDto(AjdksSelfIntroductionDto selfIntroductionDto);

	// 모든 학생 이력서 DTO 리스트 얻기
	
	public List<AjdksSelfIntroductionDto> getSelfIntroductionDtoList();
	
	// 자격증 Dto insert
	public void registerCertification(AjdksCertificationDto certificationDto);
	
	// 특정 학생 자격증 Dto 리스트 가져오기
	public List<AjdksCertificationDto> getCertificationByStudentPk (int student_pk);
	
	
	
	// 특정 파일 이름으로 자격증 Dto 삭제
	
	public void deleteCertificationByFile(String FileName);
}
